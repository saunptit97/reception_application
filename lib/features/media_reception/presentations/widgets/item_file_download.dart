import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/common/index.dart';

class ItemFileDownload extends StatelessWidget {
  const ItemFileDownload({
    super.key,
    required this.title,
    required this.description,
    required this.isSelected,
  });
  final String title;
  final String description;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 150.h,
              width: 20,
              child: const VerticalDivider(
                color: Colors.grey,
              ),
            ),
            Positioned(
              top: 50.h,
              left: 5,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 5.w),
        Container(
          color: isSelected ? AppColors.activeColorMedia : Colors.transparent,
          width: 1.sw / 2.5,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              if (isSelected) const Icon(Icons.close)
            ],
          ),
        ),
      ],
    );
  }
}
