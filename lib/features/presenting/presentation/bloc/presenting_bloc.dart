import 'dart:io';
import 'dart:typed_data';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/features/presenting/domain/use_case/delivery_use_case.dart';
import 'package:reception_application/features/presenting/domain/use_case/speech_use_case.dart';
import 'package:smart_robot/smart_robot.dart';
import '../../../../base/bloc/base_bloc.dart';
import '../../../../base/bloc/base_bloc_state.dart';
import '../../../../base/bloc/bloc_status.dart';
import '../../../../di/di_setup.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../data/model/position_model.dart';
import '../../data/model/position_request.dart';
import '../../data/model/sensor_info_model.dart';
import '../../data/model/task_status_model.dart';
import '../../domain/entity/position_entity.dart';
import '../../domain/entity/task_status_entity.dart';

part 'presenting_bloc.freezed.dart';
part 'presenting_bloc.g.dart';
part 'presenting_event.dart';
part 'presenting_state.dart';

@injectable
class PresentingBloc extends BaseBloc<PresentingEvent, PresentingState> {
  PresentingBloc(this._speechUseCase, this._deliveryUseCase)
      : super(PresentingState.init()) {
    on<PresentingEvent>(
        (PresentingEvent event, Emitter<PresentingState> emit) async {
      await event.when(
        showMessage: () => onShowMessage(emit),
        speechToText: (File file) => speechToText(emit, file),
        textToSpeech: (String audio, String language) =>
            textToSpeech(emit, audio, language),
        initWaypoints: (List<PositionEntity> positions) =>
            onInitListPositions(emit, positions),
        cancelTask: () => onCancelTask(emit),
        continueTask: () => onContinueTask(emit),
        pauseTask: () => onPauseTask(emit),
        syncSensorStatus: () => onSyncSensorStatus(emit),
        nextTask: () => onNextTask(emit),
      );
    });
  }

  final SpeechUseCase _speechUseCase;
  final DeliveryUseCase _deliveryUseCase;

  bool _enableSyncSensorStatus = false;

  Future onShowMessage(Emitter<PresentingState> emit) async {
    emit(state.copyWith(message: "Error"));
  }

  onInitListPositions(
      Emitter<PresentingState> emit, List<PositionEntity> positions) async {
    emit(state.copyWith(
        waypoints: positions,
        status: BaseStateStatus.loading,
        currentWaypointIndex: 0,
        currentLocation: positions[0]));

    await _setPositionGoto(emit);
  }

  Future<void> onNextTask(Emitter<PresentingState> emit) async {
    if (state.currentWaypointIndex! < (state.waypoints?.length ?? 1) - 1) {
      emit(state.copyWith(
          currentWaypointIndex: (state.currentWaypointIndex ?? 0) + 1,
          taskStatus: null,
          status: BaseStateStatus.idle));
      await _setPositionGoto(emit);
    } else {
      emit(state.copyWith(
          taskStatus:
              TaskStatusEntity(status: TaskStatus.done, message: "Done")));
    }
  }

  Future<void> _setPositionGoto(Emitter<PresentingState> emit) async {
    PositionRequest positionRequest = PositionRequest(
      x: state.waypoints?[state.currentWaypointIndex ?? 0].x,
      y: state.waypoints?[state.currentWaypointIndex ?? 0].y,
      angle: state.waypoints?[state.currentWaypointIndex ?? 0].angle,
      id: state.waypoints?[state.currentWaypointIndex ?? 0].id,
      name: state.waypoints?[state.currentWaypointIndex ?? 0].name,
      type: state.waypoints?[state.currentWaypointIndex ?? 0].type?.value,
    );
    emit(state.copyWith(status: BaseStateStatus.loading, taskStatus: null));
    await onCheckSensorStats(emit);
    if (state.status == BaseStateStatus.sensorDie) {
      // AudioUtils.playAudio(ActionType.stopTurnOn);
      emit(state.copyWith(
          message: 'SYNC_SENSOR_STATUS',
          taskStatus:
              TaskStatusEntity(status: TaskStatus.die, message: "Die")));
      _enableSyncSensorStatus = true;
      return;
    }
    final result = await _deliveryUseCase.setPositionGoTo(positionRequest);
    emit(state.copyWith(status: BaseStateStatus.idle));
    bool isSuccess = false;
    result.fold((l) {
      l.when(
        httpInternalServerError: (errorBody) {
          emit(state.copyWith(message: errorBody));
        },
        httpUnAuthorizedError: () => null,
        httpUnknownError: (message) {
          String message = "Can not set up position";
          if (state.waypoints?[state.currentWaypointIndex ?? 0].type ==
              PositionType.production) {
            message = "Can not set up position";
          }
          emit(state.copyWith(
            message: message,
            status: BaseStateStatus.failed,
          ));
        },
      );
    }, (r) {
      isSuccess = true;
      final listWaypoints = state.waypoints;
      listWaypoints?[state.currentWaypointIndex ?? 0].startedAt =
          DateTime.now();
      listWaypoints?[state.currentWaypointIndex ?? 0].status =
          TaskStatus.ongoing;
      emit(state.copyWith(
          waypoints: listWaypoints,
          taskStatus: TaskStatusEntity(
              status: TaskStatus.ongoing, message: "Ongoing")));
    });
    // await Future.delayed(const Duration(milliseconds: 1000));
    if (isSuccess) {
      await _getCurrentTaskStatus(emit);
    } else {
      return;
    }
    // final listWaypoints = state.waypoints;
    // listWaypoints?[state.currentWaypointIndex ?? 0].status = state.taskStatus?.status;
    // emit(state.copyWith(waypoints: listWaypoints, message: ''));
    // if(state.taskStatus?.status == TaskStatus.paused || state.taskStatus?.status == TaskStatus.die) {
    //   return;
    // }

    // int uponStatusValue = (await _localStorage.get<int?>(PreferenceKeys.uponDestinationStatus) ?? 2);
    // UponStatus? uponStatus = $enumDecodeNullable($UponStatusEnumMap, uponStatusValue);
    // if (state.taskStatus?.status == TaskStatus.success) {
    //   if (state.waypoints?[state.currentWaypointIndex ?? 0].type == PositionType.delivery) {
    //     _dashboardUseCase.updateSuccessPointInDay(1);
    //     AudioUtils.playAudio(ActionType.taskArrived);
    //   } else if (state.waypoints?[state.currentWaypointIndex ?? 0].type == PositionType.production) {
    //     AudioUtils.playAudio(ActionType.arrivedProductPoint);
    //   } else {
    //     await PlayerAudio.stop();
    //   }
    // }
    // emit(state.copyWith(currentWaypointIndex: state.currentWaypointIndex! + 1, uponDestinationStatus: uponStatus));
    // if ((state.currentWaypointIndex ?? 0) + 1 > (state.waypoints?.length ?? 0)) {
    //   return;
    // }
    // if (uponStatus == UponStatus.countDown) {
    //   int countDownTime = await _localStorage.get<int?>(PreferenceKeys.countDownTime) ?? 60; // default 60s
    //   emit(state.copyWith(countDownNextTaskSeconds: countDownTime));
    //
    //   _timerCountDownNextTask = Timer.periodic(const Duration(seconds: 1), (timer) async {
    //     --countDownTime;
    //     emit(state.copyWith(countDownNextTaskSeconds: (state.countDownNextTaskSeconds ?? 0) - 1));
    //     if ((state.countDownNextTaskSeconds ?? 0) <= 0) {
    //       timer.cancel();
    //     }
    //   });
    //   _completer = Completer();
    //   _timer = Timer(Duration(seconds: countDownTime), () async {
    //     await _setPositionGoto(emit);
    //     _completer?.complete();
    //   });
    //   await _completer?.future;
    //   _completer = null;
    // } else {
    //   return;
    // }
  }

  Future<void> _getCurrentTaskStatus(Emitter<PresentingState> emit) async {
    bool hasError = false;
    if (state.taskStatus?.status == TaskStatus.paused ||
        state.taskStatus?.status == null) {
      return;
    }
    // if (isClosed) {
    //   await onCancelTask(emit);
    //   return;
    // }
    onCheckSensorStats(emit);
    if (state.status == BaseStateStatus.sensorDie) {
      // AudioUtils.playAudio(ActionType.stopTurnOn);
      emit(state.copyWith(
          message: 'SYNC_SENSOR_STATUS',
          taskStatus:
              TaskStatusEntity(status: TaskStatus.die, message: "Die")));
      _enableSyncSensorStatus = true;
      return;
    }
    final result = await _deliveryUseCase.getCurrentTaskStatus();
    await result.fold((l) async {
      l.when(
        httpInternalServerError: (errorBody) {
          emit(state.copyWith(
              message: errorBody, status: BaseStateStatus.internalServerError));
        },
        httpUnAuthorizedError: () => null,
        httpUnknownError: (message) {
          emit(state.copyWith(
              message: "Cannot get location status",
              status: BaseStateStatus.failed));
        },
      );
      hasError = true;
    }, (r) async {
      if (state.taskStatus?.status == TaskStatus.paused) {
        return;
      }

      // if (state.taskStatus?.status == r.status) {
      //   return;
      // }
      if (state.taskStatus?.status == TaskStatus.die) {
        return;
      }
      if (state.taskStatus?.status != r.status) {
        // if (r.status == TaskStatus.controlFailure) {
        //   await AudioUtils.playAudio(ActionType.controlFailure);
        // } else if (r.status == TaskStatus.invalidGoalPose) {
        //   await AudioUtils.playAudio(ActionType.destPointError);
        // } else if (r.status == TaskStatus.invalidStartPose) {
        //   await AudioUtils.playAudio(ActionType.startPointError);
        // } else if (r.status == TaskStatus.noTopologyIsSetted) {
        //   await AudioUtils.playAudio(ActionType.missingTopo);
        // } else {
        //   await PlayerAudio.stop();
        // }
        if (r.status == TaskStatus.success) {
          emit(state.copyWith(
              taskStatus: TaskStatusEntity(
                  status: TaskStatus.success, message: "Success"),
              message: "MOVING_SUCCESS"));
        } else {
          emit(state.copyWith(taskStatus: r));
        }
      }
    });
    if (state.status == BaseStateStatus.internalServerError ||
        state.status == BaseStateStatus.failed ||
        state.taskStatus?.status == TaskStatus.success) {
      return;
    } else {
      if (hasError) {
        return;
      }
      await Future.delayed(const Duration(seconds: 1));
      await _getCurrentTaskStatus(emit);
    }
  }

  onContinueTask(Emitter<PresentingState> emit) async {
    await _setPositionGoto(emit);
  }

  onCancelTask(Emitter<PresentingState> emit) async {
    final result = await _deliveryUseCase.cancelCurrentTaskStatus();
    result.fold((l) {
      l.when(
        httpInternalServerError: (errorBody) {
          emit(state.copyWith(
              message: errorBody, status: BaseStateStatus.internalServerError));
        },
        httpUnAuthorizedError: () => null,
        httpUnknownError: (message) {
          emit(state.copyWith(
              message: "Cannot cancel task", status: BaseStateStatus.failed));
        },
      );
    }, (r) {
      emit(state.copyWith(
          status: BaseStateStatus.success, message: 'cancel_task_success'));
    });
  }

  onPauseTask(Emitter<PresentingState> emit) async {
    final result = await _deliveryUseCase.cancelCurrentTaskStatus();
    result.fold((l) {
      l.when(
        httpInternalServerError: (errorBody) {
          emit(state.copyWith(
              message: errorBody, status: BaseStateStatus.internalServerError));
        },
        httpUnAuthorizedError: () => null,
        httpUnknownError: (message) {
          emit(
              state.copyWith(message: message, status: BaseStateStatus.failed));
        },
      );
    }, (r) {
      emit(state.copyWith(
          taskStatus: state.taskStatus
                  ?.copyWith(status: TaskStatus.paused, message: "Pause") ??
              TaskStatusEntity(status: TaskStatus.paused, message: "Pause")));
    });
  }

  Future speechToText(Emitter<PresentingState> emit, File file) async {
    final result = await _speechUseCase.speechToText(file);
    result.fold((l) {
      l.when(
        httpInternalServerError: (errorBody) {
          emit(state.copyWith(
              message: errorBody, status: BaseStateStatus.internalServerError));
        },
        httpUnAuthorizedError: () => null,
        httpUnknownError: (message) {
          emit(state.copyWith(message: null, status: BaseStateStatus.failed));
        },
      );
    }, (r) {
      emit(state.copyWith(message: "Success", lastMessage: r.fullText));
    });
    deleteFile(file.path);
  }

  Future textToSpeech(
      Emitter<PresentingState> emit, String text, String language) async {
    final result = await _speechUseCase.textToSpeech(text, language);
    result.fold((l) {
      l.when(
        httpInternalServerError: (errorBody) {
          emit(state.copyWith(
              message: errorBody, status: BaseStateStatus.internalServerError));
        },
        httpUnAuthorizedError: () => null,
        httpUnknownError: (message) {
          emit(state.copyWith(message: null, status: BaseStateStatus.failed));
        },
      );
    }, (r) {
      if (r.audio != null) {
        Int16List bytes = Int16List.fromList(r.audio!);
        getIt<SmartRobot>().playWaveformAudio(bytes);
      }
    });
  }

  Future<void> deleteFile(String path) async {
    final File file = File(path);
    if (file.existsSync()) {
      file.deleteSync();
      print('Audio file deleted: $path');
    }
  }

  Future<void> onCheckSensorStats(Emitter<PresentingState> emit) async {
    final result = await _deliveryUseCase.getSensorStatus();
    result.fold((l) {
      l.when(
        httpInternalServerError: (errorBody) {
          emit(state.copyWith(
              message: errorBody, status: BaseStateStatus.internalServerError));
        },
        httpUnAuthorizedError: () => null,
        httpUnknownError: (message) {
          emit(
              state.copyWith(message: message, status: BaseStateStatus.failed));
        },
      );
    }, (r) {
      for (var element in r) {
        if (element.id == 'e_stop') {
          if (element.status == SensorInfoStatus.die) {
            emit(state.copyWith(
                message: 'SENSOR_ERROR', status: BaseStateStatus.sensorDie));
          } else {
            if (state.taskStatus?.status == TaskStatus.die) {
              emit(state.copyWith(
                  message: 'SENSOR_LIVE',
                  status: BaseStateStatus.sensorLive,
                  taskStatus: TaskStatusEntity(
                      status: TaskStatus.paused, message: "Pause")));
              // AudioUtils.playAudio(ActionType.stopTurnOff);
            }
            _enableSyncSensorStatus = false;
          }
        }
      }
    });
  }

  onSyncSensorStatus(Emitter<PresentingState> emit) async {
    if (isClosed) {
      return;
    }
    if (!_enableSyncSensorStatus) {
      return;
    }
    await onCheckSensorStats(emit);
    await Future.delayed(const Duration(seconds: 1));
    await onSyncSensorStatus(emit);
  }
}
