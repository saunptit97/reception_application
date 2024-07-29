import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/app_theme/app_styles.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 1.sw,
        height: 45.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: AppStyles.s16w400),
        ),
      ),
    );
  }
}
