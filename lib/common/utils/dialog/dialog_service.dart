import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/common/widgets/buttons/custom_text_button.dart';
import 'package:reception_application/common/widgets/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:reception_application/gen/assets.gen.dart';

class DialogService {
  static bool _isShowLoading = false;
  static bool _isShowDownloading = false;

  static Future<dynamic> showActionDialog(BuildContext context,
      {String? leftButtonText,
      String? rightButtonText,
      VoidCallback? onPressedLeftButton,
      VoidCallback? onPressedRightButton,
      String? title,
      Widget? decorationWidget,
      String? description,
      TextStyle? titleTextStyle,
      TextStyle? descriptionTextStyle,
      TextStyle? leftButtonTextStyle,
      TextStyle? rightButtonTextStyle,
      Color? leftButtonColor,
      Color? rightButtonColor,
      Color? leftButtonTextColor,
      Color? rightButtonTextColor,
      EdgeInsets? insetPadding,
      Function(bool value)? valueCheckbox}) {
    // show the dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            insetPadding: insetPadding ??
                EdgeInsets.symmetric(horizontal: 1.sw / 4, vertical: 24.h),
            backgroundColor: Colors.white,
            child: _DialogWidget(
              valueCheckbox: valueCheckbox,
              leftButtonTextStyle: leftButtonTextStyle,
              leftButtonText: leftButtonText,
              leftButtonColor: leftButtonColor,
              leftButtonTextColor: leftButtonTextColor,
              onPressedLeftButton: onPressedLeftButton,
              title: title,
              description: description,
              decorationWidget: decorationWidget,
              descriptionTextStyle: descriptionTextStyle,
              rightButtonText: rightButtonText,
              rightButtonTextColor: rightButtonTextColor,
              onPressedRightButton: onPressedRightButton,
              rightButtonColor: rightButtonColor,
              rightButtonTextStyle: rightButtonTextStyle,
            ));
      },
    );
  }

  static Future<dynamic> showCustomDialog(BuildContext context,
      {Widget? child,
      EdgeInsets? insetPadding,
      bool barrierDismissible = true,
      Function(bool value)? valueCheckbox}) {
    // show the dialog
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 1,
            insetPadding: insetPadding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            backgroundColor: Colors.white,
            child: child);
      },
    );
  }

  static Future<dynamic> showLoading(BuildContext context) {
    if (_isShowLoading) {
      return Future.value();
    }
    _isShowLoading = true;
    // show the dialog
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              height: 100.w,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Lottie.asset(Assets.lottie.loading.path,
                    width: 100.w, height: 100.w),
              ),
            ));
      },
    );
  }

  static Future<dynamic> showDownloading(BuildContext context) {
    if (_isShowDownloading) {
      return Future.value();
    }
    _isShowDownloading = true;
    // show the dialog
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 200.w,
              width: 300.w,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Đang tải dữ liệu',
                    style: AppStyles.s16w600,
                  ),
                  Lottie.asset(Assets.lottie.downloading.path,
                      width: 150.w, height: 150.w),
                ],
              ),
            ));
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (_isShowLoading) {
      Navigator.of(context).pop();
      _isShowLoading = false;
    }
  }

  static void hideDownloading(BuildContext context) {
    if (_isShowDownloading) {
      Navigator.of(context).pop();
      _isShowDownloading = false;
    }
  }
}

class _DialogWidget extends StatefulWidget {
  final String? leftButtonText;
  final String? rightButtonText;
  final VoidCallback? onPressedLeftButton;
  final VoidCallback? onPressedRightButton;
  final String? title;
  final Widget? decorationWidget;
  final String? description;
  final Widget? descriptionWidget;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
  final TextStyle? leftButtonTextStyle;
  final TextStyle? rightButtonTextStyle;
  final Color? leftButtonColor;
  final Color? rightButtonColor;
  final Color? leftButtonTextColor;
  final Color? rightButtonTextColor;
  final Function(bool value)? valueCheckbox;

  const _DialogWidget({
    Key? key,
    this.leftButtonText,
    this.rightButtonText,
    this.onPressedLeftButton,
    this.descriptionWidget,
    this.onPressedRightButton,
    this.title,
    this.decorationWidget,
    this.description,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.leftButtonTextStyle,
    this.rightButtonTextStyle,
    this.leftButtonColor,
    this.rightButtonColor,
    this.leftButtonTextColor,
    this.rightButtonTextColor,
    this.valueCheckbox,
  }) : super(key: key);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<_DialogWidget> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.decorationWidget == null
              ? Column(
                  children: [
                    Text(widget.title ?? "Thông báo",
                        style: widget.titleTextStyle ??
                            AppStyles.s20w500.copyWith(
                              color: AppColors.primary,
                            )),
                    const SizedBox(
                      height: 4,
                    ),
                    const Divider(
                      color: Color(0xFFD3DCE6),
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          widget.decorationWidget != null
              ? Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: widget.decorationWidget,
                )
              : const SizedBox.shrink(),
          widget.descriptionWidget ?? const SizedBox.shrink(),
          widget.description != null
              ? Text(widget.description ?? "",
                  textAlign: TextAlign.center,
                  style: widget.descriptionTextStyle ??
                      AppStyles.s18w400.copyWith(
                        color: AppColors.textTitle,
                      ))
              : const SizedBox.shrink(),
          const SizedBox(
            height: 16,
          ),
          widget.valueCheckbox == null
              ? const SizedBox.shrink()
              : Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomCheckBoxWidget(
                        onChange: () {
                          setState(() {
                            _selected = !_selected;
                          });
                          widget.valueCheckbox!(_selected);
                        },
                        value: _selected,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          "Chặn mọi người thêm tôi vào nhóm",
                          // style: widget.descriptionTextStyle ??
                          //     AppTextStyles.regularW500(context, size: 16),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
          Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  title: widget.leftButtonText ?? "OK",
                  onPressed: widget.onPressedLeftButton,
                  isDisable: false,
                  borderRadius: 8.r,
                  backgroundColor: widget.leftButtonColor ?? AppColors.primary,
                  textStyle: widget.leftButtonTextStyle ??
                      AppStyles.s10w500.copyWith(
                        color: widget.leftButtonColor ?? AppColors.white,
                      ),
                ),
              ),
              widget.rightButtonText != null
                  ? const SizedBox(
                      width: 16,
                    )
                  : const SizedBox.shrink(),
              widget.rightButtonText != null
                  ? Expanded(
                      child: CustomTextButton(
                        title: widget.rightButtonText ?? "",
                        onPressed: widget.onPressedRightButton,
                        isDisable: false,
                        borderRadius: 8.r,
                        backgroundColor:
                            widget.rightButtonColor ?? AppColors.gray,
                        textStyle: widget.rightButtonTextStyle ??
                            AppStyles.s10w500.copyWith(
                              color: widget.rightButtonTextColor ??
                                  AppColors.white,
                            ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }
}
