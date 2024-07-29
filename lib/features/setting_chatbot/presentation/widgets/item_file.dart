import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/gen/locale_keys.g.dart';

class ItemFileWidget extends StatelessWidget {
  const ItemFileWidget({
    super.key,
    required this.file,
    this.description = '',
    this.onTap,
  });
  final String description;
  final String file;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          file,
          style: AppStyles.s14w700,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(description),
      ],
    );
  }
}
