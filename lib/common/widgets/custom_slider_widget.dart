import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../app_theme/app_colors.dart';
import '../app_theme/app_styles.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({
    super.key,
    required this.onChanged,
    required this.value,
    required this.divisions,
    required this.min,
    required this.max,
  });
  final Function(double) onChanged;
  final double value;
  final int divisions;
  final double min;
  final double max;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            var newValue = value - (max - min) / divisions;
           onChanged.call(newValue);
          },
          child: Assets.svg.icMinus.svg(
            color: AppColors.richElectricBlue,
            width: 14.sp,
            height: 14.sp,
          ),
        ),
        SizedBox(width: 8.w,),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.richElectricBlue,
              inactiveTrackColor: AppColors.grey,
              trackShape: const RoundedRectSliderTrackShape(),
              valueIndicatorColor: AppColors.richElectricBlue,
              valueIndicatorTextStyle: AppStyles.s13w400
                  .copyWith(color: AppColors.white),
              valueIndicatorShape:
              const DropSliderValueIndicatorShape(),
              showValueIndicator: ShowValueIndicator.always,
              trackHeight: 6.h,
              thumbColor: Colors.white,
              thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 10.h),
              // overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 12.r),
            ),
            child: Slider(
              value: value,
              divisions: divisions,
              onChanged: (value) {
                onChanged.call(value);
              },
              min: min,
              max: max,
            ),
          ),
        ),
        SizedBox(width: 8.w,),
        InkWell(
          onTap: () async {
            var newValue = value + (max - min) / divisions;
            onChanged.call(newValue);
          },
          child: Assets.svg.icAdd.svg(
            color: AppColors.richElectricBlue,
            width: 14.sp,
            height: 14.sp,
          ),
        ),
      ],
    );
  }
}