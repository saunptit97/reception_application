import 'package:app_settings/app_settings.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reception_application/base/network/dio/dio_builder.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/di/di_setup.dart';
import 'package:restart_app/restart_app.dart';

import '../../../../common/widgets/textfields/app_textfield.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../domain/entity/network_entity.dart';
import 'widget/connect_network_widget.dart';

class NetworkSettingPage extends StatefulWidget {
  const NetworkSettingPage({
    super.key,
    required this.onConnectNetwork,
    this.networkEntity,
    required this.wifiList,
    this.isIncorrectPassword = false,
    this.enableDebugMode = false,
  });

  final Function(String ssid, String password) onConnectNetwork;
  final NetworkEntity? networkEntity;
  final List<NetworkEntity> wifiList;
  final bool isIncorrectPassword;
  final bool enableDebugMode;

  @override
  State<NetworkSettingPage> createState() => _NetworkSettingPageState();
}

class _NetworkSettingPageState extends State<NetworkSettingPage> {
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  bool isIncorrectPassword = false;

  bool isSwitchOn = false;
  String ipServer = '';
  TextEditingController baseURlController = TextEditingController();
  FocusNode baseURlFocusNode = FocusNode();
  LocalStorage localStorage = getIt<LocalStorage>();

  @override
  void initState() {
    Ipify.ipv4().then((value) {
      setState(() {
        ipServer = value;
      });
    });
    super.initState();
    baseURlController.text = DioBuilder().getUrl();
    baseURlFocusNode.addListener(() {
      if (!baseURlFocusNode.hasFocus) {
        String? baseUrl = baseURlController.text;
        if (baseUrl != DioBuilder().getUrl()) {
          localStorage.save(PreferenceKeys.baseUrl, baseUrl);
          DioBuilder().setBaseUrl(baseUrl);
          showConfirmDialog();
        }
      }
    });
  }

  void showConfirmDialog() {
    DialogService.showActionDialog(context,
        insetPadding:
            EdgeInsets.symmetric(horizontal: 1.sw / 4, vertical: 24.h),
        title: LocaleKeys.app_title.tr(),
        titleTextStyle: AppStyles.s20w500.copyWith(color: AppColors.textTitle),
        description: LocaleKeys.please_restart_app_to_apply_changes.tr(),
        descriptionTextStyle:
            AppStyles.s16w400.copyWith(color: AppColors.textTitle),
        leftButtonText: LocaleKeys.restart_now.tr(),
        leftButtonTextStyle: AppStyles.s14w500.copyWith(color: AppColors.white),
        onPressedLeftButton: () {
      Restart.restartApp();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isSwitchOn ? _buildSwitchWifi() : _buildDeviceConnectWifi();
  }

  Widget _buildDeviceConnectWifi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.h,
        ),
        Text(
          LocaleKeys.navigation_system_network_status.tr(),
          style: AppStyles.s16w400
              .copyWith(color: AppColors.textTitle.withOpacity(0.8)),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.boxShadow,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  if (widget.networkEntity?.ssid != null)
                    Assets.svg.icWifi.svg(
                      color: AppColors.alertLink,
                      width: 15.sp,
                      height: 15.sp,
                    ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          widget.networkEntity?.ssid ??
                              LocaleKeys.no_connection.tr(),
                          style: AppStyles.s14w400
                              .copyWith(color: AppColors.textTitle),
                        ),
                        if (widget.networkEntity?.ip != null &&
                            widget.networkEntity?.ip != '')
                          Text(
                            ' (${widget.networkEntity?.ip})',
                            style: AppStyles.s14w400
                                .copyWith(color: AppColors.textTitle),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CustomTextButton(
                    title: (widget.networkEntity?.ssid == null ||
                            widget.networkEntity?.ssid == '')
                        ? LocaleKeys.connect_network.tr()
                        : LocaleKeys.switch_network.tr(),
                    width: 100.w,
                    textStyle:
                        AppStyles.s12w400.copyWith(color: AppColors.white),
                    isDisable: false,
                    onPressed: () async {
                      setState(() {
                        isSwitchOn = true;
                      });
                    },
                    borderRadius: 8.r,
                  )
                ],
              ),
            ],
          ),
        ),
        if (widget.enableDebugMode)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                LocaleKeys.for_developers.tr(),
                style: AppStyles.s16w400
                    .copyWith(color: AppColors.textTitle.withOpacity(0.8)),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.boxShadow,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          ipServer,
                          style: AppStyles.s14w500
                              .copyWith(color: AppColors.textTitle),
                        ),
                        const Spacer(),
                        CustomTextButton(
                          title: LocaleKeys.go_to_settings.tr(),
                          width: 100.w,
                          textStyle: AppStyles.s10w400
                              .copyWith(color: AppColors.white),
                          isDisable: false,
                          onPressed: () async {
                            AppSettings.openAppSettings(
                                type: AppSettingsType.wireless);
                          },
                          borderRadius: 8.r,
                        )
                      ],
                    ),
                    Divider(
                      color: AppColors.divider,
                      height: 24.h,
                      thickness: 1,
                    ),
                    Row(children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Endpoint',
                        style: AppStyles.s14w500
                            .copyWith(color: AppColors.textTitle),
                      ),
                      const Spacer(),
                      SizedBox(
                          width: 300.w,
                          child: AppTextField(
                            controller: baseURlController,
                            focusNode: baseURlFocusNode,
                          ))
                    ])
                  ],
                ),
              ),
            ],
          )
      ],
    );
  }

  Widget _buildSwitchWifi() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () async {
              setState(() {
                isSwitchOn = false;
              });
            },
            child: Assets.svg.icMove.svg(
              color: AppColors.gray,
              width: 24.sp,
              height: 24.sp,
            ),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  LocaleKeys.other_wifi.tr(),
                  style: AppStyles.s14w400.copyWith(
                    color: AppColors.textTitle.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.boxShadow,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: widget.wifiList.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.finding_wifi.tr(),
                              style: AppStyles.s13w300.copyWith(
                                color: AppColors.textTitle,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            const CupertinoActivityIndicator()
                          ],
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final accessPoint = widget.wifiList[index];
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 24.w,
                              ),
                              Assets.svg.icWifi.svg(
                                color: AppColors.textSubTitle,
                                width: 15.sp,
                                height: 15.sp,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      accessPoint.ssid ?? '',
                                      style: AppStyles.s12w400.copyWith(
                                        color: AppColors.textTitle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      accessPoint.ssid ?? '',
                                      style: AppStyles.s9w400.copyWith(
                                        color: AppColors.textSubTitle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              InkWell(
                                onTap: () {
                                  _onConnectNetwork(context, accessPoint);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.richElectricBlue,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 8.h),
                                  child: Text(
                                    LocaleKeys.connect.tr(),
                                    style: AppStyles.s10w400.copyWith(
                                      color: AppColors.textTitle,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 24.w),
                            child: Divider(
                              height: 24.h,
                              color: AppColors.divider,
                            ),
                          );
                        },
                        itemCount: widget.wifiList.length))
          ],
        ),
      ],
    );
  }

  void _onConnectNetwork(BuildContext context, NetworkEntity accessPoint) {
    DialogService.showCustomDialog(context,
        barrierDismissible: false,
        insetPadding: EdgeInsets.symmetric(horizontal: 1.sw / 4),
        child: ConnectNetworkWidget(
            onConnected: (ssid, password) {
              widget.onConnectNetwork.call(ssid, password);
            },
            isIncorrectPassword: widget.isIncorrectPassword,
            accessPoint: accessPoint));
  }
}
