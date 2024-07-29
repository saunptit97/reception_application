import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../common/constants.dart';
import '../../../../common/widgets/custom_checkbox_widget.dart';
import '../../../../gen/locale_keys.g.dart';

class LanguageSettingPage extends StatefulWidget {
  const LanguageSettingPage({super.key, required this.onChangeLanguage, this.languageCode});
  final Function(Locale) onChangeLanguage;
  final String? languageCode;

  @override
  State<LanguageSettingPage> createState() => _LanguageSettingPageState();

}

class _LanguageSettingPageState extends State<LanguageSettingPage>{

  @override
  void initState() {
    super.initState();
  }

  void setLanguage(Locale localeSelect) {
    widget.onChangeLanguage(localeSelect);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.select_display_language.tr(),
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
                    value: context.locale.languageCode == LocalizationConstants.enUSLocale.languageCode,
                    iconRadio: true,
                    onChange: () async {
                      setLanguage(LocalizationConstants.enUSLocale);
                    },),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(LocaleKeys.english.tr(), style: AppStyles.s16w400.copyWith(
                    color: AppColors.textTitle,
                  ),)
                ],
              ),
              Divider(
                height: 16.w,
                thickness: 1,
                color: AppColors.divider,),
              Row(
                children: [
                  CustomCheckBoxWidget(
                    value: context.locale.languageCode == LocalizationConstants.viLocale.languageCode,
                    iconRadio: true,
                    onChange: () async {
                      setLanguage(LocalizationConstants.viLocale);
                    },),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(LocaleKeys.vietnamese.tr(), style: AppStyles.s16w400.copyWith(
                    color: AppColors.textTitle,
                  ),)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}