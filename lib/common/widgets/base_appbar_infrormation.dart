import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/app_theme/app_colors.dart';
import 'package:reception_application/common/app_theme/app_styles.dart';
import 'package:reception_application/common/logger/logger.dart';
import 'package:reception_application/gen/assets.gen.dart';

import '../../di/di_setup.dart';
import '../provider/robot_info_provider.dart';
import 'connectivity_widget.dart';
import 'time_widget.dart';

class BaseAppbarInformation extends StatefulWidget {
  const BaseAppbarInformation({super.key});

  @override
  State<BaseAppbarInformation> createState() => _BaseAppbarInformationState();
}

class _BaseAppbarInformationState extends State<BaseAppbarInformation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final robotInfo = context.watch<RobotInfoProvider>();
    Widget pinIcon;
    if ((robotInfo.pinLevel ?? 0) >= 80) {
      pinIcon = Assets.svg.icBatteryFull.svg(
        color: AppColors.textTitle,
        height: 12.sp,
        width: 10.sp,
      );
    } else if ((robotInfo.pinLevel ?? 0) >= 60) {
      pinIcon = Assets.svg.icBattery.svg(
        color: AppColors.textTitle,
        height: 12.sp,
        width: 10.sp,
      );
    } else if ((robotInfo.pinLevel ?? 0) >= 40) {
      pinIcon = Assets.svg.icBatteryHalf.svg(
        color: AppColors.textTitle,
        height: 12.sp,
        width: 10.sp,
      );
    } else {
      pinIcon = Assets.svg.icBatteryFull.svg(
        color: AppColors.textTitle,
        height: 12.sp,
        width: 10.sp,
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.svg.icRobot.svg(
              color: AppColors.textTitle,
              width: 10.sp,
              height: 10.sp,
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  robotInfo.robotId ?? '',
                  style: AppStyles.s12w400.copyWith(
                    color: AppColors.textTitle,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 8.w,
        ),
        Row(
          children: [
            const ConnectivityWidget(),
            SizedBox(
              width: 8.w,
            ),
            const TimeDisplayWidget(),
          ],
        ),
        SizedBox(
          width: 8.w,
        ),
        Row(
          children: [
            pinIcon,
            SizedBox(
              width: 1.w,
            ),
            Text(
              ' ${robotInfo.pinLevel}%',
              style: AppStyles.s12w400.copyWith(
                color: AppColors.textTitle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
