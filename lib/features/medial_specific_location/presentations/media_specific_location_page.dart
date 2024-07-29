import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/gen/locale_keys.g.dart';

import 'widgets/item_location.dart';

@RoutePage()
class MediaSpecificLocationPage extends StatelessWidget {
  const MediaSpecificLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.background,
      appBar: BaseAppBar(
        hasBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.media_specific_location.tr(),
              style: AppStyles.appTitle,
            ),
            SizedBox(
              height: 50.h,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return ItemLocationWidget(
                    address: 'Location A',
                    file: index == 0 ? "introduction.mp4" : null,
                  );
                },
                itemCount: 10,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15.h);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
