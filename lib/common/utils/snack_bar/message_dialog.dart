import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../app_theme/app_colors.dart';
import '../../app_theme/app_styles.dart';
import '../../widgets/buttons/custom_text_button.dart';

enum DialogType { success, error, info, warning }

class DialogMessage extends StatelessWidget {
  final String? message;
  final String? title;
  final String? rightButtonText;
  final Function? onRightPressed;
  final DialogType type;
  final String? leftButtonText;
  final Function? onLeftPressed;

  const DialogMessage({super.key,
    this.message,
    this.title,
    this.rightButtonText,
    this.onRightPressed,
    this.type = DialogType.success,
    this.leftButtonText,
    this.onLeftPressed
  });

  @override
  Widget build(BuildContext context) {

    Widget icon = Assets.svg.icDone.svg(
      width: 40.w,
      height: 40.w,
      color: AppColors.alertSuccess,
    );
    Color titleColor = AppColors.alertSuccess;
    if (type == DialogType.error) {
      titleColor = AppColors.alertError;
      icon = Assets.svg.icError.svg(
        width: 40.w,
        height: 40.w,
        color: AppColors.alertError,
      );
    } else if (type == DialogType.info) {
      titleColor = AppColors.alertLink;
      icon = Assets.svg.icInfo.svg(
        width: 40.w,
        height: 40.w,
        color: AppColors.alertLink,
      );
    } else if (type == DialogType.warning) {
      titleColor = AppColors.alertWarning;
      icon = Assets.svg.icInfo.svg(
        width: 40.w,
        height: 40.w,
        color: AppColors.alertWarning,
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (title != null)
            Padding(
              padding: EdgeInsets.only(bottom: 8.h, top: 10.h),
              child: Text(
                title ?? 'Thông báo',
                style: AppStyles.s14w500.copyWith(
                  color: titleColor,
                ),
              ),
            ),
          SizedBox(height: 10.h,),
          icon,
          SizedBox(height: 20.h,),
          Text(message ?? '', style: AppStyles.s12w400, textAlign: TextAlign.center,),
          SizedBox(height: 40.h,),
          Row(
            children: [
              if (leftButtonText != null)
                Expanded(
                  child: CustomTextButton(
                    title: leftButtonText ?? LocaleKeys.cancel.tr(),
                    isDisable: false,
                    borderRadius: 10.r,
                    textStyle: AppStyles.s12w400,
                    backgroundColor: AppColors.gray,
                    onPressed: () {
                      if (onLeftPressed != null) {
                        onLeftPressed?.call();
                      } else {
                        Navigator.of(context).pop();
                      }
                    },),
                ),
              if (leftButtonText != null)
                SizedBox(width: 10.w,),
              Expanded(
                child: CustomTextButton(
                 title: rightButtonText ?? LocaleKeys.ok.tr(),
                 isDisable: false,
                 borderRadius: 10.r,
                 textStyle: AppStyles.s12w400,
                 onPressed: () {
                   if (onRightPressed != null) {
                     onRightPressed?.call();
                   } else {
                     Navigator.of(context).pop();
                   }
                 },),
              ),
            ],
          ),
        ],
      ),
    );
  }
}