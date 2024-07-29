import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../di/di_setup.dart';
import '../../features/robot_info/domain/use_case/robot_info_use_case.dart';

class RobotInfoProvider extends ChangeNotifier {
  RobotInfoProvider() {
    _init();
  }

  String? _robotName;
  String? _robotId;
  String? _navVersion;
  String? _appVersion;
  String? _pinStatus;
  int? _pinLevel;
  bool? _charging;
  String? _ip;
  String? _wifiName;

  String? get robotName => _robotName;
  String? get robotId => _robotId;
  String? get navVersion => _navVersion;
  String? get appVersion => _appVersion;
  String? get pinStatus => _pinStatus;
  bool? get charging => _charging;
  int? get pinLevel => _pinLevel;
  String? get ip => _ip;
  String? get wifiName => _wifiName;

  double? _volume;
  double? _brightness;

  double get volume => _volume ?? 0;
  double get brightness => _brightness ?? 0;
  set brightness(double? value) {
    _brightness = value;
    notifyListeners();
  }

  set volume(double? value) {
    _volume = value;
    notifyListeners();
  }

  final RobotInfoUseCase _robotInfoUseCase = getIt<RobotInfoUseCase>();

  Timer? _infoTimer;
  Timer? _networkTimer;
  Timer? _pinTimer;

  void _init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    _appVersion = "$version+$buildNumber";
    brightness = await ScreenBrightness().current * 100;
    volume = await VolumeController().getVolume() * 100;
    notifyListeners();
    // syncRobotInfo();
    // syncWifiInfo();
    // syncRobotPin();
  }

  void syncRobotInfo() async {
    if (_infoTimer != null && (_infoTimer?.isActive ?? false)) {
      _infoTimer!.cancel();
    }
    final robotInfo = await _robotInfoUseCase.getRobotInfo();
    robotInfo.fold((l) => null,
            (r) {
      _robotId = r.robotId;
      _navVersion = r.navVersion;
    });
    notifyListeners();
    if (robotId == null) {
      _infoTimer = Timer(const Duration(seconds: 20), () {
        syncRobotInfo();
      });
    }
  }

  void syncWifiInfo() async {
    if (_networkTimer != null && (_networkTimer?.isActive ?? false)) {
      _networkTimer!.cancel();
    }
    final wifiInfo = await _robotInfoUseCase.getWifiInfo();
    wifiInfo.fold((l) => null,
            (r) {
      _ip = r.ip;
      _wifiName = r.wifiName;
    });
    notifyListeners();
    _networkTimer = Timer(const Duration(seconds: 60), () {
      syncWifiInfo();
    });
  }

  void syncRobotPin() async {
    if (_pinTimer != null && (_pinTimer?.isActive ?? false)) {
      _pinTimer!.cancel();
    }
    final pinInfo = await _robotInfoUseCase.getPinStatus();
    pinInfo.fold((l) => null,
            (r) {
      _pinStatus = r.pinStatus;
      _pinLevel = r.pinLevel;
      _charging = r.charging;
    });
    notifyListeners();
    var timeCount = _charging ?? false ? 20 : 60;
    _pinTimer = Timer(Duration(seconds: timeCount), () {
      syncRobotPin();
    });
  }

  set wifiName(String? value) {
    _wifiName = value;
    notifyListeners();
  }
}