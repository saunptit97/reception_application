import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/widgets/buttons/custom_text_button.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../common/constants.dart';
import '../../../../common/widgets/custom_checkbox_widget.dart';
import '../../../../gen/locale_keys.g.dart';
import 'widgets/item_file.dart';

@RoutePage()
class SettingChatbotPage extends StatefulWidget {
  const SettingChatbotPage({
    super.key,
  });

  @override
  State<SettingChatbotPage> createState() => _SettingChatbotPageState();
}

class _SettingChatbotPageState extends State<SettingChatbotPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.select_language_chatbot.tr(),
          style: AppStyles.s16w400.copyWith(
            color: AppColors.textTitle.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.boxShadow,
                spreadRadius: 0,
                blurRadius: 8.r,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
          child: Column(
            children: [
              Row(
                children: [
                  CustomCheckBoxWidget(
                    value: context.locale.languageCode ==
                        LocalizationConstants.enUSLocale.languageCode,
                    iconRadio: true,
                    onChange: () async {},
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    LocaleKeys.english.tr(),
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.textTitle,
                    ),
                  )
                ],
              ),
              Divider(
                height: 16.w,
                thickness: 1,
                color: AppColors.divider,
              ),
              Row(
                children: [
                  CustomCheckBoxWidget(
                    value: context.locale.languageCode ==
                        LocalizationConstants.viLocale.languageCode,
                    iconRadio: true,
                    onChange: () async {},
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    LocaleKeys.vietnamese.tr(),
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.textTitle,
                    ),
                  )
                ],
              ),
              Divider(
                height: 16.w,
                thickness: 1,
                color: AppColors.divider,
              ),
              Row(
                children: [
                  CustomCheckBoxWidget(
                    value: context.locale.languageCode ==
                        LocalizationConstants.viLocale.languageCode,
                    iconRadio: true,
                    onChange: () async {},
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    LocaleKeys.japan.tr(),
                    style: AppStyles.s16w400.copyWith(
                      color: AppColors.textTitle,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
          LocaleKeys.select_document_list_chatbot.tr(),
          style: AppStyles.s16w400.copyWith(
            color: AppColors.textTitle.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        ListView.separated(
          itemBuilder: (_, index) {
            return ItemFileWidget(
              file: 'introduction.docx',
              description: 'Description',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10.w,
            );
          },
          itemCount: 3,
          shrinkWrap: true,
        ),
        SizedBox(
          height: 50.h,
        ),
        CustomTextButton(
          title: LocaleKeys.edit_document.tr(),
          isDisable: false,
          backgroundColor: AppColors.primary,
          onPressed: () {},
          borderRadius: 4.sp,
          textStyle: AppStyles.s14w500.copyWith(
            color: AppColors.white,
          ),
        )
      ],
    );
  }
}
