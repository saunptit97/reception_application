import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../common/utils/snack_bar/snack_bar_helper.dart';
import '../../../../gen/locale_keys.g.dart';

class VersionSettingPage extends StatefulWidget {
  const VersionSettingPage({super.key,
    required this.appVersion,
    required this.navigationVersion,
    required this.powerBoardVersion,
    this.onEnableDebugMode,
  });
  final String appVersion;
  final String navigationVersion;
  final String powerBoardVersion;
  final Function? onEnableDebugMode;

  @override
  State<VersionSettingPage> createState() => _VersionSettingPageState();
}

class _VersionSettingPageState extends State<VersionSettingPage> {

  int countTap = 0;
  Timer? timer;

  onEnableDebugMode() {
    setState(() {
      countTap++;
    });

    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    if (countTap == 5) {
      SnackBarHelper().showInfo(context, LocaleKeys.enable_developer_mode.tr());
      widget.onEnableDebugMode?.call();
    }
    timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        countTap = 0;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 16.w, left: 24.w, right: 24.w, bottom: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: onEnableDebugMode,
                child: Row(
                  children: [
                    Text(LocaleKeys.app_version.tr(),
                        style: AppStyles.s12w400.copyWith(
                          color: AppColors.textTitle,
                        )),
                    Expanded(
                      child: Text(
                        widget.appVersion,
                        textAlign: TextAlign.end,
                        style: AppStyles.s12w500.copyWith(
                          color: AppColors.textTitle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 20.w,
                color: AppColors.divider,
              ),
              Row(
                children: [
                  Text(LocaleKeys.navigation_version.tr(),
                      style: AppStyles.s12w400.copyWith(
                        color: AppColors.textTitle,
                      )),
                  Expanded(
                    child: Text(
                      widget.navigationVersion,
                      textAlign: TextAlign.end,
                      style: AppStyles.s12w500.copyWith(
                        color: AppColors.textTitle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}