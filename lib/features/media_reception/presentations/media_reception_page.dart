import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/app_theme/app_colors.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/common/widgets/index.dart';
import 'package:reception_application/gen/locale_keys.g.dart';

import 'widgets/item_file.dart';
import 'widgets/item_file_download.dart';

@RoutePage()
class MediaReceptionPage extends StatelessWidget {
  const MediaReceptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.background,
      appBar: BaseAppBar(
        hasBack: true,
      ),
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 1.sw / 3,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.all_medial_fiels.tr(),
                style: AppStyles.appTitle,
              ),
              SizedBox(height: 50.h),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    return const ItemFileWidget(
                      title: "Tile",
                      description: "Description",
                      isSelected: true,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Divider();
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
        const VerticalDivider(
          thickness: 1,
          width: 1,
          color: AppColors.divider,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.media_at_reception.tr(),
                  style: AppStyles.appTitle,
                ),
                SizedBox(height: 50.h),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (_, index) {
                      return ItemFileDownload(
                        title: "Tile",
                        description: "Description",
                        isSelected: index == 0,
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
