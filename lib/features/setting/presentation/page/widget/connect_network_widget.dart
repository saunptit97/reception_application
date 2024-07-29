import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_theme/app_colors.dart';
import '../../../../../common/app_theme/app_styles.dart';
import '../../../../../common/local_data/shared_pref.dart';
import '../../../../../common/widgets/buttons/custom_text_button.dart';
import '../../../../../common/widgets/textfields/app_textfield.dart';
import '../../../../../di/di_setup.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../../domain/entity/network_entity.dart';

class ConnectNetworkWidget extends StatefulWidget {
  final Function(String ssid, String password) onConnected;
  final NetworkEntity accessPoint;
  final bool isIncorrectPassword;

  const ConnectNetworkWidget(
      {super.key, required this.onConnected, required this.accessPoint, this.isIncorrectPassword = false});

  @override
  State<ConnectNetworkWidget> createState() => _ConnectNetworkWidgetState();
}

class _ConnectNetworkWidgetState extends State<ConnectNetworkWidget> {
  final TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
  bool isIncorrectPassword = false;

  LocalStorage localStorage = getIt<LocalStorage>();

  @override
  void initState() {
    super.initState();
    isIncorrectPassword = widget.isIncorrectPassword;
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          isIncorrectPassword = false;
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant ConnectNetworkWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      isIncorrectPassword = widget.isIncorrectPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${LocaleKeys.enter_password_for.tr()} "${widget.accessPoint.ssid}"',
            style: AppStyles.s14w400.copyWith(
              color: AppColors.deepDark,
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          AppTextField(
            hintText: LocaleKeys.password.tr(),
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {},
            textStyle: AppStyles.s14w400.copyWith(
              color: AppColors.deepDark,
            ),
            controller: passwordController,
            hintStyle: AppStyles.s14w400.copyWith(
              color: AppColors.textSubTitle,
            ),
            focusNode: passwordFocusNode,
            autofocus: true,
            isPassword: true,
            isShowIconFailed: false,
            errorText: LocaleKeys.please_check_your_wifi_password_try_again.tr(),
            state: isIncorrectPassword
                ? TextFieldState.validateFailed
                : TextFieldState.none,
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextButton(
                title: LocaleKeys.cancel.tr(),
                textStyle: AppStyles.s12w400.copyWith(
                  color: AppColors.textTitle,
                ),
                textColor: AppColors.textTitle,
                onPressed: () async {
                  isIncorrectPassword = false;
                  context.router.pop();
                },
                borderRadius: 10.r,
                backgroundColor: AppColors.gray2,
                    isDisable: false,
              )),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: CustomTextButton(
                title: LocaleKeys.connect.tr(),
                    textStyle: AppStyles.s12w400.copyWith(
                  color: AppColors.white,
                ),
                isDisable: false,
                borderRadius: 10.r,
                backgroundColor:  AppColors.alertLink,
                onPressed: () {
                  passwordFocusNode.unfocus();
                  _onConnectWifi(
                    context: context,
                      ssid: widget.accessPoint.ssid ?? '',
                      password: passwordController.text);
                },
              ))
            ],
          )
        ],
      ),
    );
  }

  void _onConnectWifi({required BuildContext context, required String ssid, required String password}) async {
      widget.onConnected(ssid, password);
  }
}
