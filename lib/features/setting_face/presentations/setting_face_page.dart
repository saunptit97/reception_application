import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/app_theme/app_styles.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/gen/locale_keys.g.dart';

@RoutePage()
class SettingFacePage extends StatelessWidget {
  const SettingFacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 1.sw,
        height: 45.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.face_database_version.tr(),
              style: AppStyles.s16w400,
            ),
            Row(
              children: [
                Text(
                  "1.0.1",
                  style: AppStyles.s16w400,
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      LocaleKeys.check_for_update.tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
