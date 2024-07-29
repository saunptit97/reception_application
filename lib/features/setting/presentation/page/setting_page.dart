import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/features/setting/presentation/page/location_setting.dart';
import 'package:reception_application/features/setting/presentation/page/widget/item_setting.dart';
import 'package:reception_application/features/setting_chatbot/presentation/setting_chatbot_page.dart';
import 'package:reception_application/features/setting_face/presentations/setting_face_page.dart';
import 'package:reception_application/features/setting_media/presentation/setting_media_page.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../../../common/provider/robot_info_provider.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../domain/entity/network_entity.dart';
import 'basic_setting_page.dart';
import 'language_setting_page.dart';
import 'network_setting_page.dart';
import 'version_setting_page.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  double groupAlignment = -1.0;
  int selectedIndex = 0;
  final volumeController = VolumeController();
  bool robotConnectingWifi = false;
  bool isIncorrectPassword = false;
  late Timer timer;
  NetworkEntity? networkEntity;
  bool enableDebugMode = false;

  @override
  void initState() {
    super.initState();
    volumeController.listener((volume) {});
  }

  void setLanguage(Locale localeSelect) {
    context.setLocale(localeSelect);
  }

  @override
  void dispose() {
    volumeController.removeListener();
    super.dispose();
  }

  void _showMessageDialog(BuildContext context,
      {required String title, String? message, required Widget icon}) {
    DialogService.showCustomDialog(
      context,
      insetPadding: EdgeInsets.symmetric(horizontal: 1.sw / 4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppStyles.s14w700.copyWith(
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 30.h),
            icon,
            SizedBox(height: 30.h),
            Text(
              message ?? '',
              style: AppStyles.s12w400.copyWith(
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 50.h),
            CustomTextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              title: LocaleKeys.ok.tr(),
              isDisable: false,
              borderRadius: 8.r,
              textStyle: AppStyles.s16w600.copyWith(
                color: AppColors.white,
              ),
              backgroundColor: AppColors.backgroundCard2,
            ),
          ],
        ),
      ),
    ).whenComplete(() {});
  }

  _onGetRobotConnectingWifi() {
    if (robotConnectingWifi) {
      timer = Timer(const Duration(seconds: 6), () {
        _onGetRobotConnectingWifi();
      });
    } else {
      return;
    }
  }

  List<Map<String, dynamic>> menu = [
    {
      "title": LocaleKeys.basic_settings,
      "icon": Assets.svg.icSetting.svg(
        width: 18.w,
        height: 18.w,
      ),
      "index": 0,
    },
    {
      "title": LocaleKeys.network,
      "icon": Assets.svg.icSetting.svg(
        width: 18.w,
        height: 18.w,
      ),
      "index": 1,
    },
    {
      "title": LocaleKeys.journey,
      "icon": Assets.svg.icSetting.svg(
        width: 18.w,
        height: 18.w,
      ),
      "index": 2,
    },
    {
      "title": LocaleKeys.media,
      "icon": Assets.svg.icSetting.svg(
        width: 18.w,
        height: 18.w,
      ),
      "index": 3,
    },
    {
      "title": LocaleKeys.chat_bot,
      "icon": Assets.svg.icSetting.svg(
        width: 18.w,
        height: 18.w,
      ),
      "index": 4,
    },
    {
      "title": LocaleKeys.face,
      "icon": Assets.svg.icSetting.svg(
        width: 18.w,
        height: 18.w,
      ),
      "index": 5,
    },
    {
      "title": LocaleKeys.language_setting,
      "icon": Assets.svg.icSetting.svg(
        width: 18.w,
        height: 18.w,
      ),
      "index": 6,
    },
    {
      "title": LocaleKeys.version,
      "icon": Assets.svg.icSetting.svg(
        width: 18.w,
        height: 18.w,
      ),
      "index": 7,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        hasBack: true,
        // backgroundColor: AppColors.background,
        title: LocaleKeys.setting.tr(),
        textStyle: AppStyles.s16w600.copyWith(
          color: AppColors.textTitle,
        ),
      ),
      backgroundColor: AppColors.background,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.sw / 3,
            padding: EdgeInsets.only(top: 10.w, left: 16.w, right: 16.w),
            child: ListView.separated(
              itemBuilder: (_, index) {
                return ItemSettingWidget(
                  icon: menu[index]['icon'],
                  title: menu[index]['title'].toString().tr(),
                  isActive: int.parse(menu[index]['index'].toString()) ==
                      selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = int.parse(
                        menu[index]['index'].toString(),
                      );
                    });
                  },
                );
              },
              separatorBuilder: (_, index) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemCount: menu.length,
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
            color: AppColors.divider,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: getCurrentWidget(selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCurrentWidget(int index) {
    switch (index) {
      case 0:
        return BasicSettingPage(
          speedValue: 0.4,
          speedValueChanged: (speed) {},
        );
      case 1:
        return NetworkSettingPage(
          onConnectNetwork: (String ssid, String password) {
            setState(() {
              isIncorrectPassword = false;
              networkEntity = NetworkEntity(ssid: ssid, password: password);
            });
            _onSendConnectToServer(context, ssid);
          },
          networkEntity: NetworkEntity(ip: '12.9.23.12', ssid: 'Rikkei 2.4G'),
          wifiList: [],
          enableDebugMode: enableDebugMode,
        );
      case 2:
        return const LocationSetting();
      case 3:
        return const SettingMediaPage();
      case 4:
        return const SettingChatbotPage();
      case 5:
        return const SettingFacePage();
      case 6:
        return LanguageSettingPage(
          onChangeLanguage: (locale) {
            setLanguage(locale);
          },
          languageCode: 'vi',
        );
      case 7:
        return VersionSettingPage(
          appVersion: context.watch<RobotInfoProvider>().appVersion ?? '',
          powerBoardVersion: '',
          navigationVersion:
              context.watch<RobotInfoProvider>().navVersion ?? '',
          onEnableDebugMode: () {
            setState(() {
              enableDebugMode = true;
            });
          },
        );
      default:
        return Container();
    }
  }

  void _onSendConnectToServer(BuildContext context, String ssid) async {
    DialogService.showCustomDialog(context,
        barrierDismissible: false,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                Assets.lottie.wifi.path,
                width: 100.w,
                height: 100.w,
              ),
              Text(
                '${LocaleKeys.connecting_robot_to_wifi.tr()} "$ssid"',
                style: AppStyles.s14w500.copyWith(
                  color: AppColors.textTitle,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                  timer.cancel();
                  setState(() {
                    robotConnectingWifi = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.richElectricBlue,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  child: Text(
                    LocaleKeys.cancel.tr(),
                    style: AppStyles.s10w400.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
            ],
          ),
        ));
  }
}
