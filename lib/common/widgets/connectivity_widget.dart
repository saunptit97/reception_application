import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../../gen/assets.gen.dart';
import '../../gen/locale_keys.g.dart';
import '../app_theme/app_colors.dart';
import '../app_theme/app_styles.dart';
import '../provider/robot_info_provider.dart';


class ConnectivityWidget extends StatefulWidget {
  const ConnectivityWidget({super.key});


  @override
  State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ConnectivityWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    String? wifiName = context.watch<RobotInfoProvider>().wifiName?.trim();
    if (wifiName != null && wifiName != '') {
      return Row(
        children: [
          Assets.svg.icWifi.svg(
            color: AppColors.textTitle,
            width: 16.sp,
            height: 16.sp,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            wifiName,
            style: AppStyles.s12w400.copyWith(color: AppColors.textTitle),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Assets.svg.icNoWifi.svg(
            color: AppColors.textTitle,
            width: 16.sp,
            height: 16.sp,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Disconnected'.tr(),
            style: AppStyles.s12w400.copyWith(color: AppColors.textTitle),
          ),
        ],
      );
    }
  }
}