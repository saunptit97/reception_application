import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/gen/locale_keys.g.dart';
import 'package:reception_application/routes/app_routes.dart';

import 'widgets/item_setting.dart';

class SettingMediaPage extends StatelessWidget {
  const SettingMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40.h,
      ),
      height: 1.sh,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.media_setting.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20.h),
            ItemSetting(
              title: LocaleKeys.select_media_reception.tr(),
              onTap: () =>
                  context.router.navigateNamed(AppRoutes.mediaReception),
            ),
            SizedBox(height: 20.h),
            ItemSetting(
              title: LocaleKeys.select_media_at_specific_location.tr(),
              onTap: () =>
                  context.router.navigateNamed(AppRoutes.mediaSpecificLocation),
            ),
          ],
        ),
      ),
    );
  }
}
