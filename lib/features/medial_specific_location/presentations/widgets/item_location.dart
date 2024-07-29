import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/gen/locale_keys.g.dart';

class ItemLocationWidget extends StatelessWidget {
  const ItemLocationWidget({
    super.key,
    required this.address,
    this.file,
    this.onTap,
  });
  final String address;
  final String? file;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          address,
          style: AppStyles.s14w700,
        ),
        const SizedBox(
          height: 5,
        ),
        if (file != null)
          Row(
            children: [
              Text(file!),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: onTap,
                child: Text(
                  LocaleKeys.change.tr(),
                  style: const TextStyle(color: AppColors.richElectricBlue),
                ),
              )
            ],
          )
        else
          GestureDetector(
            onTap: onTap,
            child: Text(
              LocaleKeys.select_audio_video.tr(),
              style: const TextStyle(color: AppColors.richElectricBlue),
            ),
          )
      ],
    );
  }
}
