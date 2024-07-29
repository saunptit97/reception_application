import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/provider/robot_info_provider.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../common/constants.dart';
import '../../../../common/local_data/shared_pref.dart';
import '../../../../common/utils/functions/debouncer.dart';
import '../../../../common/utils/snack_bar/snack_bar_helper.dart';
import '../../../../common/widgets/custom_slider_widget.dart';
import '../../../../common/widgets/textfields/app_textfield.dart';
import '../../../../di/di_setup.dart';
import '../../../../gen/locale_keys.g.dart';

class BasicSettingPage extends StatefulWidget {
  BasicSettingPage(
      {super.key, required this.speedValue, required this.speedValueChanged});

  final double speedValue;
  Function(double) speedValueChanged;

  @override
  State<BasicSettingPage> createState() => _BasicSettingPageState();
}

class _BasicSettingPageState extends State<BasicSettingPage> {
  final TextEditingController _countDownTimeController =
      TextEditingController();
  final FocusNode _countDownTimeFocusNode = FocusNode();
  double? volumeValue;
  double? brightnessValue;
  int minPin = 10;
  final localStorage = getIt<LocalStorage>();
  final TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initDeviceSetting();
  }

  void initDeviceSetting() async {
    int countDownTimer =
        await localStorage.get<int?>(PreferenceKeys.countDownTime) ?? 60;
    _countDownTimeController.text = countDownTimer.toString();
    final brightness = await ScreenBrightness().current;
    double volume = await VolumeController().getVolume();
    int minPin = await localStorage.get<int?>(PreferenceKeys.pinLevel) ?? 10;
    _pinController.text = minPin.toString();
    setState(() {
      brightnessValue = brightness * 100;
      volumeValue = volume * 100;
      this.minPin = minPin;
    });
    _countDownTimeFocusNode.addListener(() {
      int countDownTime = int.tryParse(_countDownTimeController.text) ?? -1;
      if (countDownTime < 0) {
        countDownTime = 0;
        _countDownTimeController.text = '0';
        SnackBarHelper()
            .showError(context, LocaleKeys.invalid_countdown_time.tr());
      }
      localStorage.save(PreferenceKeys.countDownTime, countDownTime);
    });
  }

  void setBrightness(double value) async {
    context.read<RobotInfoProvider>().brightness = value;
    await ScreenBrightness().setScreenBrightness(value / 100);
  }

  void setVolume(double value) {
    VolumeController().setVolume(value / 100);
    context.read<RobotInfoProvider>().volume = value;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Text(LocaleKeys.volume.tr(),
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.textTitle.withOpacity(0.7),
                    )),
                Text(
                    ' ${(volumeValue ?? context.watch<RobotInfoProvider>().volume).toInt()}',
                    style: AppStyles.s16w500.copyWith(
                      color: AppColors.textTitle,
                    )),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.boxShadow,
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CustomSliderWidget(
                value: volumeValue ?? context.watch<RobotInfoProvider>().volume,
                onChanged: (value) {
                  setState(() {
                    volumeValue = value;
                  });
                  setVolume(value);
                },
                min: 0,
                max: 100,
                divisions: 100,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Text(LocaleKeys.screen_brightness.tr(),
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.textTitle.withOpacity(0.7),
                    )),
                Text(
                    ' ${(brightnessValue ?? context.watch<RobotInfoProvider>().brightness).toInt()}',
                    style: AppStyles.s16w500.copyWith(
                      color: AppColors.textTitle,
                    )),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.boxShadow,
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CustomSliderWidget(
                value: brightnessValue ??
                    context.watch<RobotInfoProvider>().volume,
                onChanged: (value) {
                  setState(() {
                    brightnessValue = value;
                  });
                  setBrightness(value);
                },
                min: 0,
                max: 100,
                divisions: 100,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Text(LocaleKeys.running_speed.tr(),
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.textTitle.withOpacity(0.7),
                    )),
                Text(' ${widget.speedValue.toDouble().toStringAsFixed(1)}',
                    style: AppStyles.s16w500.copyWith(
                      color: AppColors.textTitle,
                    )),
                Text(' (m/s)',
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.textTitle.withOpacity(0.7),
                    )),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.boxShadow,
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CustomSliderWidget(
                value: widget.speedValue,
                onChanged: (value) {
                  widget.speedValueChanged.call(value);
                },
                min: 0.3,
                max: 1,
                divisions: 7,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Text(LocaleKeys.countdown_timer.tr(),
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.textTitle.withOpacity(0.7),
                    )),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.boxShadow,
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.countdown_timer_description.tr(),
                          style: AppStyles.s14w400.copyWith(
                            color: AppColors.textTitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  SizedBox(
                    width: 50.w,
                    child: AppTextField(
                      hintText: '0',
                      controller: _countDownTimeController,
                      focusNode: _countDownTimeFocusNode,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      keyboardType: TextInputType.number,
                      textStyle: AppStyles.s14w400.copyWith(
                        color: AppColors.textTitle,
                      ),
                    ),
                  ),
                  Text(
                    LocaleKeys.seconds.tr(),
                    style: AppStyles.s14w400.copyWith(
                      color: AppColors.textTitle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Text(LocaleKeys.minimum_battery_level.tr(),
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.textTitle.withOpacity(0.7),
                    )),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.boxShadow,
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys
                              .robot_will_not_perform_task_when_battery_level_is_bellow
                              .tr(),
                          style: AppStyles.s14w400.copyWith(
                            color: AppColors.textTitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  SizedBox(
                    width: 50.w,
                    child: AppTextField(
                      hintText: '0',
                      controller: _pinController,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      keyboardType: TextInputType.number,
                      textStyle: AppStyles.s14w400.copyWith(
                        color: AppColors.textTitle,
                      ),
                      onChanged: (value) {
                        int pinValue = int.tryParse(value) ?? 0;
                        if (pinValue > 100) {
                          SnackBarHelper().showError(context,
                              LocaleKeys.battery_level_not_exceed_100.tr());
                          _pinController.text = '100';
                          pinValue = 100;
                        }
                        if (pinValue < 0) {
                          SnackBarHelper().showError(context,
                              LocaleKeys.battery_level_not_less_than_0.tr());
                          _pinController.text = '0';
                          pinValue = 0;
                        }
                        Debouncer(milliseconds: 500).run(() {
                          localStorage.save(PreferenceKeys.pinLevel, pinValue);
                        });
                      },
                    ),
                  ),
                  Text(
                    ' %',
                    style: AppStyles.s14w400.copyWith(
                      color: AppColors.textTitle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
