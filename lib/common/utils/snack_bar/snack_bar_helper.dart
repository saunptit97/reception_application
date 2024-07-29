import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/common/app_theme/app_styles.dart';
import 'package:reception_application/gen/assets.gen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../gen/locale_keys.g.dart';
import '../dialog/dialog_service.dart';
import 'message_dialog.dart';

enum SnackBarType { success, error, info }

@singleton
class SnackBarHelper {
  //todo: icon & color
  void _show(
    BuildContext context,
    String message, {
    SnackBarType type = SnackBarType.success,
    int duration = 3,
    Function()? onTap,
  }) async {
    Widget icon = const Icon(Icons.check);
    Color color = Colors.green;
    // haptic();
    switch (type) {
      case SnackBarType.success:
        icon = Assets.svg.icDone.svg(
          width: 26,
          height: 26,
          color: Colors.white,
        );
        color = Colors.green;
        break;
      case SnackBarType.error:
        icon = Assets.svg.icError.svg(
          width: 26,
          height: 26,
          color: Colors.white,
        );
        color = Colors.red;
        break;
      case SnackBarType.info:
        icon = const Icon(Icons.info_outline, color: Colors.white, size: 28);
        color = Colors.blue;
        break;
      default:
        icon = const Icon(Icons.check);
        color = Colors.green;
        break;
    }

    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
        iconRotationAngle: 0,
        iconPositionLeft: 10.w,
        textStyle: AppStyles.s12w400.copyWith(
          color: Colors.white,
        ),
        backgroundColor: color,
        messagePadding: const EdgeInsets.only(left: 56, right: 16),
        icon: icon,
      ),
      displayDuration: Duration(seconds: duration),
      onTap: onTap,
    );
  }

  dynamic showSuccess(
    BuildContext context,
    String message, {
    Function()? onTap,
  }) =>
      _show(
        context,
        message,
        onTap: onTap,
      );

  dynamic showInfo(
    BuildContext context,
    String message, {
    Function()? onTap,
  }) =>
      _show(
        context,
        message,
        onTap: onTap,
        type: SnackBarType.info,
      );

  dynamic showError(
    BuildContext context,
    String message,
  ) =>
      _show(
        context,
        message,
        type: SnackBarType.error,
      );

  dynamic showDialogError(
    BuildContext context,
    String message, {
    String? title,
    String? buttonText,
    Function()? whenComplete,
  }) {
    return DialogService.showCustomDialog(
      context,
      insetPadding: EdgeInsets.symmetric(horizontal: 1.sw / 3.5),
      child: DialogMessage(
        message: message,
        title: title,
        rightButtonText: buttonText ?? LocaleKeys.ok.tr(),
        onRightPressed: () {
          Navigator.of(context).pop();
        },
        type: DialogType.error,
      ),
    ).whenComplete(() => whenComplete?.call());
  }
}
