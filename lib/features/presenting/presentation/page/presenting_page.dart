import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reception_application/common/extensions/duration_extension.dart';
import 'package:reception_application/common/extensions/stream_extension.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/common/utils/functions/debouncer.dart';
import 'package:reception_application/common/widgets/base_appbar_infrormation.dart';
import 'package:reception_application/di/di_setup.dart';
import 'package:reception_application/features/presenting/presentation/bloc/presenting_bloc.dart';
import 'package:reception_application/features/setup_locations/domain/entity/file_entity.dart';
import 'package:reception_application/features/setup_locations/domain/entity/media_entity.dart';
import 'package:reception_application/gen/assets.gen.dart';
import 'package:reception_application/gen/locale_keys.g.dart';
import 'package:record/record.dart';
import 'package:smart_robot/smart_robot.dart';
import 'package:video_player/video_player.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../base/base_widget.dart';
import '../../../../base/bloc/bloc_status.dart';
import '../../../setup_locations/domain/entity/location_entity.dart';
import '../../data/model/task_status_model.dart';
import '../../data/model/text_model.dart';
import '../../domain/entity/position_entity.dart';

@RoutePage()
class PresentingPage extends StatefulWidget {
  const PresentingPage(
      {super.key, required this.locations, required this.positions});
  final List<LocationEntity> locations;
  final List<PositionEntity> positions;

  @override
  State<PresentingPage> createState() => _PresentingPageState();
}

class _PresentingPageState extends BaseState<PresentingPage, PresentingEvent,
    PresentingState, PresentingBloc> {
  String websocket = dotenv.get("CHATBOT_WEBSOCKET",
      fallback: "wss://rec-robot-chatbot.rikkei.org");
  WebSocketChannel? channel;

  int _currentIndex = 0;
  List<LocationEntity> _locations = [];
  late AudioPlayer audioPlayer;
  Completer? _mediaCompleter;
  Completer? _countDownCompleter;
  Timer? _countDownTimer;
  final List<StreamSubscription> _subscriptions = [];
  int _countDown = 0;
  bool isShowAction = false;
  Timer? _showActionTimer;
  bool _isPause = false;
  Duration? mediaDuration;
  Duration? mediaPosition;
  bool _isCancel = false;

  /// using when user click next button, cancel current task
  Timer? _onGoingTimer;
  Completer? _onGoingCompleter;

  VideoPlayerController? _controller;
  LocalStorage localStorage = getIt<LocalStorage>();
  SmartRobot? smartRobot;

  bool _isShowQuestion = false;
  String _latestMessage = '';
  StreamSubscription? _smartRobotSubscription;
  bool isSpeech = false;
  int recordFlag = 0;
  bool isPresentingMedia = false;

  final Debouncer _debouncerSpeech = Debouncer(milliseconds: 60000);
  final record = AudioRecorder();

  @override
  void initState() {
    super.initState();
    smartRobot = getIt<SmartRobot>();
    smartRobot?.initTriggerWordModel();
    smartRobot?.initVADModel();
    _locations = widget.locations;
    audioPlayer = AudioPlayer();
    audioPlayer.setLoopMode(LoopMode.off);
    bloc.add(PresentingEvent.initWaypoints(widget.positions));
    // initPresentLocation();
    requestMicroPermission();
    initWebSocket();
    _smartRobotSubscription =
        smartRobot?.speechDetectEvent.listen((event) async {
      if (!mounted) {
        return;
      }
      try {
        if (event == "start_vad") {
          resetCountDown();
        } else {
          print("event: $event");
          bloc.add(PresentingEvent.speechToText(File(event)));
          resetCountDown();
        }
      } catch (e) {
        print(e);
      }
    });
  }

  void resetCountDown() {
    _countDownTimer?.cancel();
    _countDownCompleter?.complete();
    _countDownCompleter = null;
    setState(() {
      _isShowQuestion = true;
    });
    _debouncerSpeech.run(() {
      setState(() {
        _isShowQuestion = false;
      });
      smartRobot?.stopVAD();
      _onInitCountDown();
    });
  }

  @override
  void listener(BuildContext context, PresentingState state) {
    super.listener(context, state);
    if (state.lastMessage != null) {
      context.locale.languageCode;
      channel?.sink.add(jsonEncode({
        "message": state.lastMessage,
        "language": context.locale.languageCode,
        "session_id": "1234",
        "robot_id": "1234"
      }));
      setState(() {
        _latestMessage = state.lastMessage!;
      });
    }
    if (state.taskStatus?.status == TaskStatus.success &&
        state.message == "MOVING_SUCCESS") {
      PositionEntity? currentWaypoint =
          state.waypoints?[state.currentWaypointIndex ?? 0];
      if (currentWaypoint != null) {
        playMedia(currentWaypoint.file);
      }
    }
    if (state.status == BaseStateStatus.internalServerError) {
      SnackBarHelper().showDialogError(context,
          state.message ?? LocaleKeys.an_error_occurred_try_again.tr());
    } else if (state.status == BaseStateStatus.failed) {
      SnackBarHelper().showDialogError(context,
          state.message ?? LocaleKeys.an_error_occurred_check_again.tr());
    }
  }

  Future<void> playMedia(FileEntity? file) async {
    if (file?.getMediaType() == MediaType.audio) {
      setState(() {
        isPresentingMedia = true;
      });
      if (file?.localFilePath != null && file?.localFilePath != '') {
        await audioPlayer.setFilePath(file?.localFilePath ?? '');
      } else {
        await audioPlayer.setUrl(file?.url ?? '');
      }
      _mediaCompleter = Completer();
      var duration = await audioPlayer.load();
      setState(() {
        mediaDuration = duration;
      });
      audioPlayer.positionStream.listen((currentDuration) {
        setState(() {
          mediaPosition = currentDuration;
        });
        if (currentDuration.inMilliseconds == mediaDuration?.inMilliseconds) {
          if (isPresentingMedia == false) {
            return;
          }
          setState(() {
            isPresentingMedia = false;
          });
          if (_mediaCompleter?.isCompleted == false) {
            _mediaCompleter?.complete();
            audioPlayer.stop();
            _onInitCountDown();
          } else {
            audioPlayer.stop();
            _onInitCountDown();
          }
        }
      }, cancelOnError: true).addToList(_subscriptions);
      await audioPlayer.play();
    } else if (file?.getMediaType() == MediaType.video) {
      setState(() {
        isPresentingMedia = true;
      });
      _mediaCompleter = Completer();
      if (file?.localFilePath != null && file?.localFilePath != '') {
        _controller = VideoPlayerController.file(File(file!.localFilePath!));
      } else {
        _controller =
            VideoPlayerController.networkUrl(Uri.parse(file?.url ?? ''));
      }
      await _controller?.initialize();
      await _controller?.play();
      setState(() {
        mediaDuration = _controller?.value.duration;
      });
      _controller?.addListener(() {
        setState(() {
          mediaPosition = _controller?.value.position;
        });
        if (_controller?.value.position == _controller?.value.duration) {
          setState(() {
            isPresentingMedia = false;
          });
          _onInitCountDown();
          if (_mediaCompleter?.isCompleted == false) {
            _mediaCompleter?.complete();
          }
        }
      });
    } else {
      _onInitCountDown();
    }
  }

  Future<void> initWebSocket() async {
    try {
      final wsUrl = Uri.parse(websocket);
      channel = IOWebSocketChannel.connect(wsUrl);
      await channel?.ready;
      channel?.stream.listen((event) {
        RobotModel robotModel = RobotModel.fromJson(jsonDecode(event));
        if (robotModel.data?.response != null) {
          String decodedString = utf8.decode(
              utf8.encode(jsonDecode('"${robotModel.data!.response!}"')));
          if (decodedString.isNotEmpty) {
            bloc.add(PresentingEvent.textToSpeech(
                decodedString, context.locale.languageCode));
          }
        }
      }, onError: (error) {
        print("Error from websocket: $error");
      }, onDone: () {
        print("Websocket is done");
      });
    } catch (e) {
      print("Error when connect to websocket: $e");
    }
  }

  void _onInitCountDown() async {
    _countDownTimer?.cancel();
    _countDownCompleter?.complete();
    _countDownCompleter = null;
    int countDownTime =
        await localStorage.get<int?>(PreferenceKeys.countDownTime) ?? 60;
    smartRobot?.startRecord();
    setState(() {
      _countDown = countDownTime;
    });
    _countDownCompleter = Completer();
    _countDownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_countDown > 0) {
          setState(() {
            _countDown--;
          });
        } else {
          timer.cancel();
          _countDownCompleter?.complete();
          _onNext();
        }
      },
    );
    await _countDownCompleter?.future;
    _countDownCompleter = null;
  }

  // void initPresentLocation() async {
  //   setState(() {
  //     _locations[_currentIndex].status = LocationStatus.going;
  //   });
  //   _onGoingCompleter = Completer();
  //   _onGoingTimer = Timer(const Duration(seconds: 10), () {
  //     _onGoingCompleter?.complete();
  //   });
  //   await _onGoingCompleter?.future;
  //   _onGoingCompleter = null;
  //   if ( _locations[_currentIndex].status == LocationStatus.cancel) {
  //     return;
  //   }
  //   setState(() {
  //     _locations[_currentIndex].status = LocationStatus.presenting;
  //     mediaPosition = null;
  //   });
  //   MediaEntity? media = _locations[_currentIndex].media;
  //   if (media?.type == MediaType.audio) {
  //     if (media?.filePath != null && media?.filePath != '') {
  //       await audioPlayer.setFilePath(media?.filePath ?? '');
  //     } else {
  //       await audioPlayer.setUrl(media?.url ?? '');
  //     }
  //     _mediaCompleter = Completer();
  //     var duration = await audioPlayer.load();
  //     setState(() {
  //       mediaDuration = duration;
  //     });
  //     audioPlayer.positionStream.listen((currentDuration) {
  //       setState(() {
  //         mediaPosition = currentDuration;
  //       });
  //       if (currentDuration.inSeconds == mediaDuration?.inSeconds) {
  //         setState(() {
  //           _locations[_currentIndex].status = LocationStatus.done;
  //         });
  //         if (_mediaCompleter?.isCompleted == false) {
  //           _mediaCompleter?.complete();
  //           audioPlayer.stop();
  //         }
  //       }
  //     }, cancelOnError: true).addToList(_subscriptions);
  //     await audioPlayer.play();
  //   }
  //   else if (media?.type == MediaType.video) {
  //     _mediaCompleter = Completer();
  //     if (media?.filePath != null && media?.filePath != '') {
  //       _controller = VideoPlayerController.file(File(media!.filePath!));
  //     } else {
  //       _controller = VideoPlayerController.networkUrl(Uri.parse(media?.url ?? ''));
  //     }
  //     await _controller?.initialize();
  //     await _controller?.play();
  //     setState(() {
  //       mediaDuration = _controller?.value.duration;
  //     });
  //     _controller?.addListener(() {
  //       setState(() {
  //         mediaPosition = _controller?.value.position;
  //       });
  //       if (_controller?.value.position == _controller?.value.duration) {
  //         setState(() {
  //           _locations[_currentIndex].status = LocationStatus.done;
  //         });
  //         if (_mediaCompleter?.isCompleted == false) {
  //           _mediaCompleter?.complete();
  //         }
  //       }
  //     });
  //   }
  //   else {
  //     setState(() {
  //       _locations[_currentIndex].status = LocationStatus.done;
  //     });
  //   }
  //   await _mediaCompleter?.future;
  //   _mediaCompleter = null;
  //   if (_currentIndex == _locations.length - 1) {
  //     return;
  //   }
  //   if (_isCancel) {
  //     setState(() {
  //       _isCancel = false;
  //     });
  //     return;
  //   }
  //   // await startBackgroundService();
  //   smartRobot?.startRecord();
  //   int countDownTime = await localStorage.get<int?>(PreferenceKeys.countDownTime) ?? 60;
  //   setState(() {
  //     _countDown = countDownTime;
  //   });
  //   _countDownCompleter = Completer();
  //   _countDownTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
  //     if (_countDown > 0) {
  //       setState(() {
  //         _countDown--;
  //       });
  //     } else {
  //       timer.cancel();
  //       _countDownCompleter?.complete();
  //       if (_currentIndex < _locations.length - 1) {
  //         _onNext();
  //       } else {
  //         smartRobot?.stopVAD();
  //       }
  //     }
  //   },);
  //   await _countDownCompleter?.future;
  //   _countDownCompleter = null;
  // }

  void _onNext() async {
    // stopBackgroundService();
    smartRobot?.stopVAD();
    bloc.add(const PresentingEvent.nextTask());
  }

  void requestMicroPermission() async {
    final status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

  @override
  void dispose() {
    _subscriptions.cancelAll();
    _mediaCompleter?.isCompleted == false ? _mediaCompleter?.complete() : null;
    _countDownCompleter?.complete();
    _countDownTimer?.cancel();
    _controller?.dispose();
    _showActionTimer?.cancel();
    _onGoingTimer?.cancel();
    audioPlayer.stop();
    audioPlayer.dispose();
    _smartRobotSubscription?.cancel();
    smartRobot?.stopVAD();
    _debouncerSpeech.dispose();
    // stopBackgroundService();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    if (_isShowQuestion) {
      return BaseScaffold(
        body: Container(
            alignment: Alignment.center,
            // color: Colors.red,
            padding: EdgeInsets.only(right: 30.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (false)
                  Assets.lottie.robot
                      .lottie(width: 300.w, height: 300.w, fit: BoxFit.contain),
                if (true)
                  Assets.lottie.listening
                      .lottie(width: 300.w, height: 300.w, fit: BoxFit.contain),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: Text(
                      _latestMessage.isEmpty
                          ? "Tôi đã sẵn sàng giúp bạn, bạn cần giúp gì?"
                          : _latestMessage,
                      style: AppStyles.s14w500.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            )),
      );
    }
    return BaseScaffold(
      isFull: true,
      backgroundColor: AppColors.background,
      appBar: const BaseAppbarInformation(),
      body: blocBuilder((context, state) {
        PositionEntity? currentWaypoint;
        PositionEntity? nextWaypoint;
        if ((state.currentWaypointIndex ?? 0) <
            (state.waypoints?.length ?? 0)) {
          currentWaypoint = state.waypoints?[state.currentWaypointIndex ?? 0];
        }
        if ((state.currentWaypointIndex ?? 0) <
            (state.waypoints?.length ?? 0) - 1) {
          nextWaypoint = state.waypoints?[state.currentWaypointIndex! + 1];
        }
        if (state.status == BaseStateStatus.loading) {
          return Center(
            child: Lottie.asset(
              Assets.lottie.loading.path,
              width: 100.w,
              height: 100.w,
            ),
          );
        }
        if (state.taskStatus?.status == TaskStatus.ongoing ||
            state.taskStatus?.status == TaskStatus.paused) {
          return Stack(
            children: [
              InkWell(
                onTap: () {
                  if (state.taskStatus?.status == TaskStatus.ongoing) {
                    bloc.add(const PresentingEvent.pauseTask());
                  }
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.taskStatus?.status == TaskStatus.ongoing)
                        Text(
                          '${LocaleKeys.moving_to.tr()} ${currentWaypoint?.name}',
                          style: AppStyles.s24w800
                              .copyWith(color: AppColors.primary),
                        ),
                      if (state.taskStatus?.status == TaskStatus.paused)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Text(
                            LocaleKeys.your_move_stopped.tr().replaceAll(
                                '{location}', currentWaypoint?.name ?? ""),
                            textAlign: TextAlign.center,
                            style: AppStyles.s24w800
                                .copyWith(color: AppColors.primary),
                          ),
                        ),
                      Transform.flip(
                        flipX: true,
                        child: Lottie.asset(
                          Assets.lottie.robotRunning.path,
                          width: 200.w,
                          height: 200.w,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: state.taskStatus?.status == TaskStatus.paused,
                child: Positioned(
                    top: 0,
                    child: Container(
                      height: 100.h,
                      color: AppColors.primaryDark.withOpacity(0.9),
                      width: 1.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.svg.icComeback.svg(
                                width: 40.h,
                                height: 32.h,
                                color: AppColors.white,
                              ),
                              Text(
                                LocaleKeys.return_to_reception.tr(),
                                style: AppStyles.s12w500
                                    .copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          InkWell(
                            onTap: () {
                              bloc.add(const PresentingEvent.continueTask());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.svg.icContinue.svg(
                                  width: 32.h,
                                  height: 32.h,
                                  color: AppColors.white,
                                ),
                                Text(
                                  LocaleKeys.continue_.tr(),
                                  style: AppStyles.s12w500
                                      .copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          InkWell(
                            onTap: () {
                              String title = LocaleKeys.skip_this_location.tr();
                              String content = LocaleKeys
                                  .do_you_want_to_skip_this_location
                                  .tr();
                              if (_currentIndex < _locations.length - 1) {
                                title =
                                    _locations[_currentIndex + 1].name ?? '';
                                content = LocaleKeys
                                    .moving_to_next_location_are_you_sure
                                    .tr();
                              }

                              DialogService.showActionDialog(context,
                                  title: title,
                                  decorationWidget: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          content,
                                          style: AppStyles.s12w400.copyWith(
                                              color: AppColors.textTitle),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Lottie.asset(
                                          Assets.lottie.robot.path,
                                          width: 50.w,
                                          height: 50.w,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          title,
                                          style: AppStyles.s16w600.copyWith(
                                              color: AppColors.primary),
                                        ),
                                      ],
                                    ),
                                  ),
                                  leftButtonText: LocaleKeys.ok.tr(),
                                  onPressedLeftButton: () {
                                    _countDownTimer?.cancel();
                                    _countDownCompleter?.complete();
                                    audioPlayer.stop();
                                    _controller?.pause();
                                    (_mediaCompleter?.isCompleted == true)
                                        ? null
                                        : _mediaCompleter?.complete();
                                    _countDownCompleter = null;
                                    _mediaCompleter = null;
                                    Navigator.pop(context);
                                    _onNext();
                                  },
                                  rightButtonText: LocaleKeys.cancel.tr(),
                                  onPressedRightButton: () {
                                    Navigator.pop(context);
                                  });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.svg.icNext.svg(
                                  width: 40.h,
                                  height: 32.h,
                                  color: AppColors.white,
                                ),
                                if (_currentIndex < _locations.length - 1)
                                  Text(
                                    '${LocaleKeys.go_to.tr()} ${_locations[_currentIndex + 1].name}',
                                    style: AppStyles.s12w500
                                        .copyWith(color: AppColors.white),
                                  ),
                                if (_currentIndex >= _locations.length - 1)
                                  Text(
                                    LocaleKeys.skip_this_location.tr(),
                                    style: AppStyles.s12w500
                                        .copyWith(color: AppColors.white),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          );
        } else if (state.taskStatus?.status == TaskStatus.controlFailure ||
            state.taskStatus?.status == TaskStatus.invalidStartPose ||
            state.taskStatus?.status == TaskStatus.invalidGoalPose ||
            state.taskStatus?.status == TaskStatus.noTopologyIsSetted ||
            state.taskStatus?.status ==
                TaskStatus.startPoseJoinTopologyFailed ||
            state.taskStatus?.status == TaskStatus.goalPoseJoinTopologyFailed ||
            state.taskStatus?.status == TaskStatus.nonLoopCloseTopology ||
            state.taskStatus?.status == TaskStatus.tfError ||
            state.taskStatus?.status == TaskStatus.failure) {
          return InkWell(
            onTap: () {
              bloc.add(const PresentingEvent.pauseTask());
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.moving_to.tr(),
                    style: AppStyles.s20w400.copyWith(
                      color: AppColors.primary,
                      fontSize: 20.sp,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentWaypoint?.name ?? '',
                        style: AppStyles.s24w800.copyWith(
                          color: AppColors.primary,
                          fontSize: 28.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.w),
                        color: AppColors.alertError,
                        child: Text(
                          getErrorMessage(state.taskStatus?.status),
                          style: AppStyles.s20w400.copyWith(
                            color: AppColors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 24.sp,
                  )
                ],
              ),
            ),
          );
        } else if (state.taskStatus?.status == TaskStatus.success) {
          if (isPresentingMedia) {
            if (state.currentLocation?.file?.getMediaType() ==
                MediaType.audio) {
              return BaseScaffold(
                body: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isShowAction = true;
                        });
                        _showActionTimer =
                            Timer(const Duration(seconds: 5), () {
                          setState(() {
                            isShowAction = false;
                          });
                        });
                      },
                      child: Container(
                        height: 1.sh,
                        width: 1.sw,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${LocaleKeys.introducing_about.tr()} ${currentWaypoint?.name}',
                              style: AppStyles.appTitle
                                  .copyWith(color: AppColors.primary),
                            ),
                            Lottie.asset(
                              Assets.lottie.robotPresenting.path,
                              width: 200.w,
                              height: 200.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        child: Visibility(
                          visible: isShowAction,
                          child: _buildMediaDuration(
                            onSeek: (duration) {
                              audioPlayer.seek(Duration(seconds: duration));
                            },
                            onPlay: (isPlay) {
                              setState(() {
                                _isPause = isPlay;
                              });
                              _isPause
                                  ? audioPlayer.pause()
                                  : audioPlayer.play();
                            },
                          ),
                        ))
                  ],
                ),
              );
            } else if (state.currentLocation?.file?.getMediaType() ==
                MediaType.video) {
              return BaseScaffold(
                body: Stack(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            isShowAction = !isShowAction;
                          });
                          _showActionTimer =
                              Timer(const Duration(seconds: 5), () {
                            setState(() {
                              isShowAction = false;
                            });
                          });
                        },
                        child: VideoPlayer(_controller!)),
                    Positioned(
                        top: 0,
                        child: Visibility(
                          visible: isShowAction,
                          child: _buildMediaDuration(
                            onSeek: (duration) {
                              _controller?.seekTo(Duration(seconds: duration));
                            },
                            onPlay: (isPlay) {
                              setState(() {
                                _isPause = isPlay;
                              });
                              _isPause
                                  ? _controller?.pause()
                                  : _controller?.play();
                              if (_isPause) {
                                _showActionTimer?.cancel();
                              } else {
                                _showActionTimer =
                                    Timer(const Duration(seconds: 5), () {
                                  setState(() {
                                    isShowAction = false;
                                  });
                                });
                              }
                            },
                          ),
                        ))
                  ],
                ),
              );
            }
          } else {
            return BaseScaffold(
              body: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${LocaleKeys.finish_introducing_about.tr()} ${currentWaypoint?.name}',
                          style: AppStyles.appTitle
                              .copyWith(color: AppColors.primary),
                        ),
                        Lottie.asset(
                          Assets.lottie.robot.path,
                          width: 200.w,
                          height: 200.w,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        (nextWaypoint != null)
                            ? Text(
                                LocaleKeys.move_to_in_second
                                    .tr()
                                    .replaceAll(
                                        '{location}', nextWaypoint.name ?? '')
                                    .replaceAll(
                                        '{second}', _countDown.toString()),
                                style: AppStyles.appTitle
                                    .copyWith(color: AppColors.primary),
                              )
                            : Text(
                                LocaleKeys.end_in_second.tr().replaceAll(
                                    '{second}', _countDown.toString()),
                                style: AppStyles.appTitle
                                    .copyWith(color: AppColors.primary),
                              ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100.h,
                    color: AppColors.primaryDark.withOpacity(0.9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.svg.icComeback.svg(
                              width: 40.h,
                              height: 32.h,
                              color: AppColors.white,
                            ),
                            Text(
                              LocaleKeys.return_to_reception.tr(),
                              style: AppStyles.s12w500
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        InkWell(
                          onTap: () {
                            _onGoingCompleter?.complete();
                            _countDownTimer?.cancel();
                            _onNext();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.svg.icNext.svg(
                                width: 40.h,
                                height: 32.h,
                                color: AppColors.white,
                              ),
                              Text(
                                (nextWaypoint != null)
                                    ? '${LocaleKeys.go_to.tr()}  ${nextWaypoint.name}'
                                    : LocaleKeys.skip_this_location.tr(),
                                style: AppStyles.s12w500
                                    .copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        } else if (state.taskStatus?.status == TaskStatus.done) {
          return BaseScaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.we_went_through_all_locations.tr(),
                    style:
                        AppStyles.appTitle.copyWith(color: AppColors.primary),
                  ),
                  Lottie.asset(
                    Assets.lottie.robot.path,
                    width: 200.w,
                    height: 200.w,
                  ),
                  CustomTextButton(
                    title: LocaleKeys.return_to_reception.tr(),
                    onPressed: () {
                      _countDownTimer?.cancel();
                      _countDownCompleter?.complete();
                      audioPlayer.stop();
                      _controller?.pause();
                      if (_mediaCompleter?.isCompleted == false) {
                        _mediaCompleter?.complete();
                      }
                      _countDownCompleter = null;
                      _mediaCompleter = null;
                      Navigator.pop(context);
                    },
                    isDisable: false,
                    textColor: AppColors.white,
                    width: 200.w,
                    backgroundColor: AppColors.primary,
                    borderRadius: 8,
                  )
                ],
              ),
            ),
          );
        }

        return Container(
          color: Colors.red,
        );
      }),
    );
  }

  Widget _buildMediaDuration(
      {required Function(int) onSeek, required Function(bool) onPlay}) {
    return Container(
      color: AppColors.primaryDark.withOpacity(0.8),
      height: 200.h,
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 1.sw / 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _countDownTimer?.cancel();
                  _countDownCompleter?.complete();
                  audioPlayer.stop();
                  _controller?.pause();
                  _mediaCompleter?.complete();
                  _countDownCompleter = null;
                  _mediaCompleter = null;
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.svg.icComeback.svg(
                      width: 40.h,
                      height: 32.h,
                      color: AppColors.white,
                    ),
                    Text(
                      LocaleKeys.return_to_reception.tr(),
                      style: AppStyles.s12w500.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              InkWell(
                onTap: () {
                  String title = LocaleKeys.skip_this_location.tr();
                  String content =
                      LocaleKeys.do_you_want_to_skip_this_location.tr();
                  if (_currentIndex < _locations.length - 1) {
                    title = _locations[_currentIndex + 1].name ?? '';
                    content =
                        LocaleKeys.moving_to_next_location_are_you_sure.tr();
                  }

                  DialogService.showActionDialog(context,
                      title: title,
                      decorationWidget: Container(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              content,
                              style: AppStyles.s12w400
                                  .copyWith(color: AppColors.textTitle),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Lottie.asset(
                              Assets.lottie.robot.path,
                              width: 50.w,
                              height: 50.w,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              title,
                              style: AppStyles.s16w600
                                  .copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      leftButtonText: LocaleKeys.ok.tr(),
                      onPressedLeftButton: () {
                        _countDownTimer?.cancel();
                        _countDownCompleter?.complete();
                        audioPlayer.stop();
                        _controller?.pause();
                        _mediaCompleter?.complete();
                        _countDownCompleter = null;
                        _mediaCompleter = null;
                        Navigator.pop(context);
                        _onNext();
                      },
                      rightButtonText: LocaleKeys.cancel.tr(),
                      onPressedRightButton: () {
                        Navigator.pop(context);
                      });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.svg.icNext.svg(
                      width: 40.h,
                      height: 32.h,
                      color: AppColors.white,
                    ),
                    if (_currentIndex < _locations.length - 1)
                      Text(
                        '${LocaleKeys.go_to.tr()} ${_locations[_currentIndex + 1].name}',
                        style:
                            AppStyles.s12w500.copyWith(color: AppColors.white),
                      ),
                    if (_currentIndex >= _locations.length - 1)
                      Text(
                        LocaleKeys.skip_this_location.tr(),
                        style:
                            AppStyles.s12w500.copyWith(color: AppColors.white),
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isPause = !_isPause;
                  });
                  onPlay(_isPause);
                },
                icon: Icon(
                  _isPause ? Icons.play_arrow : Icons.pause,
                  color: AppColors.white,
                  size: 16.sp,
                ),
              ),
              Expanded(
                child: Slider(
                  value: mediaPosition?.inSeconds.toDouble() ?? 0,
                  max: mediaDuration?.inSeconds.toDouble() ?? 0,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    onSeek(value.toInt());
                  },
                ),
              ),
              Text(
                '${mediaPosition?.format ?? '__'} / ${mediaDuration?.format ?? '__'}',
                style: AppStyles.s11w400.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getErrorMessage(TaskStatus? status) {
    if (status == TaskStatus.controlFailure ||
        status == TaskStatus.tfError ||
        status == TaskStatus.nonLoopCloseTopology) {
      return LocaleKeys.stuck.tr();
    } else if (status == TaskStatus.invalidStartPose ||
        status == TaskStatus.startPoseJoinTopologyFailed) {
      return LocaleKeys.invalid_start_point.tr();
    } else if (status == TaskStatus.invalidGoalPose ||
        status == TaskStatus.goalPoseJoinTopologyFailed) {
      return LocaleKeys.invalid_end_point.tr();
    } else if (status == TaskStatus.noTopologyIsSetted) {
      return LocaleKeys.missing_topology.tr();
    } else {
      return status?.name ?? "Unknown error";
    }
  }
}
