import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemFileWidget extends StatelessWidget {
  const ItemFileWidget({
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
        if (isSelected) const Icon(Icons.check)
      ],
    );
  }
}
