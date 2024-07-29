import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/common/widgets/bubble_painter.dart';
import 'package:reception_application/features/face_detect/page/face_detect_page.dart';
import 'package:reception_application/features/presenting/domain/entity/position_entity.dart';
import 'package:reception_application/gen/locale_keys.g.dart';
import 'package:reception_application/routes/app_pages.dart';
import 'package:smart_robot/smart_robot.dart';

import '../../../../common/widgets/base_appbar_infrormation.dart';
import '../../../../di/di_setup.dart';
import '../../../../gen/assets.gen.dart';
import '../../../face_detect/domain/face_detect_offset.dart';
import '../../../face_detect/page/camera.dart';
import '../../../face_detect/page/widget/image_detect_rectangle.dart';
import '../../../setup_locations/domain/entity/location_entity.dart';
import '../../../setup_locations/presentation/page/event/update_selected_location.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription _subscription;
  final List<PositionEntity> _selectedLocations = <PositionEntity>[];
  final LocalStorage _localStorage = getIt<LocalStorage>();
  bool isFaceDetect = true;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    initSelectedLocations();
    _subscription =
        getIt<EventBus>().on<SelectedLocationEvent>().listen((event) {
      initSelectedLocations();
    });
  }

  void initSelectedLocations() async {
    final String locations =
        await _localStorage.get<String?>(PreferenceKeys.selectedPosition) ??
            '[]';
    final List locationsJson = jsonDecode(locations);
    _selectedLocations.clear();
    for (var location in locationsJson) {
      setState(() {
        PositionEntity locationEntity = PositionEntity.fromJson(location);
        _selectedLocations.add(locationEntity);
      });
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseScaffold(
          appBar: const BaseAppBar(
            appBarWidget: BaseAppbarInformation(),
            hasBack: false,
          ),
          backgroundColor: AppColors.background,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) {
                    //       String id = DateTime.now().toIso8601String();
                    //       return CameraApp(id: id);
                    //     },
                    //   ),
                    // );
                    context.router.push(FaceDetectRoute(onFaceDetect: null));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 1.sw / 3,
                    child: Lottie.asset(
                      Assets.lottie.robotWellcome.path,
                      repeat: true,
                      // reverse: true,
                      animate: true,
                      height: 1.sh,
                      width: 1.sw / 3,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 12.w),
                  child: Column(
                    children: [
                      CustomPaint(
                        painter: TalkBubblePainter(
                          color: AppColors.bubble,
                          isFacingLeft: false,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),
                          child: Column(
                            children: [
                              Text(
                                '${LocaleKeys.hello_i_am.tr()} Hana',
                                style: AppStyles.s30w800.copyWith(
                                  color: AppColors.textTitle,
                                ),
                              ),
                              Text(
                                LocaleKeys.may_i_help_you.tr(),
                                style: AppStyles.s24w500.copyWith(
                                  color: AppColors.textTitle,
                                ),
                              ),
                              Text(
                                LocaleKeys.please_choose_a_of_function_to_start
                                    .tr(),
                                style: AppStyles.s24w500.copyWith(
                                  color: AppColors.textTitle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    if (_selectedLocations.isEmpty) {
                                      DialogService.showActionDialog(
                                        context,
                                        title: LocaleKeys.warning.tr(),
                                        description: LocaleKeys
                                            .please_setup_location_before_start
                                            .tr(),
                                        leftButtonText: LocaleKeys.ok.tr(),
                                        leftButtonColor: AppColors.primary,
                                        leftButtonTextColor: AppColors.white,
                                        leftButtonTextStyle:
                                            AppStyles.s14w500.copyWith(
                                          color: AppColors.white,
                                        ),
                                        onPressedLeftButton: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                      return;
                                    }
                                    context.router.push(PresentingRoute(
                                      locations: const [],
                                      positions: _selectedLocations,
                                    ));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(16.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.boxShadow,
                                          blurRadius: 10.r,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      LocaleKeys.start.tr(),
                                      style: AppStyles.s30w800.copyWith(
                                        color: AppColors.textTitle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.router.push(const SettingRoute());
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(16.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.boxShadow,
                                          blurRadius: 10.r,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      LocaleKeys.setting.tr(),
                                      style: AppStyles.s30w800.copyWith(
                                        color: AppColors.textTitle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
        if (isFaceDetect)
          FaceDetectPage(onFaceDetect: (value) {
            setState(() {
              isFaceDetect = value;
            });
            if (timer?.isActive == true) {
              timer?.cancel();
              timer = Timer(const Duration(minutes: 5), () {
                setState(() {
                  isFaceDetect = true;
                });
              });
            }
          })
      ],
    );
  }
}
