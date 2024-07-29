import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/app_theme/app_colors.dart';
import 'package:reception_application/common/app_theme/app_styles.dart';

class ItemSettingWidget extends StatelessWidget {
  const ItemSettingWidget({
    super.key,
    this.onTap,
    required this.isActive,
    required this.title,
    required this.icon,
  });
  final VoidCallback? onTap;
  final bool isActive;
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColors.selectedBackground : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadow,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
        child: Row(
          children: [
            // icon,
            // SizedBox(
            //   width: 10.w,
            // ),
            Expanded(
              child: Text(
                title,
                style: AppStyles.s18w400.copyWith(
                  color: isActive ? AppColors.white : AppColors.textTitle,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: isActive ? AppColors.white : AppColors.textTitle,
              size: 20.w,
            )
          ],
        ),
      ),
    );
  }
}
