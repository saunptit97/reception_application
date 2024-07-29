

import '../../data/model/pin_info_model.dart';
import '../../data/model/robot_info_model.dart';
import '../../data/model/wifi_model.dart';

class RobotInfoEntity {
 final String? robotId;
 final String? navVersion;

  RobotInfoEntity({
    this.robotId,
    this.navVersion,
  });

  factory RobotInfoEntity.fromModel(RobotInfoModel model) {
    return RobotInfoEntity(
      robotId: model.robotId,
      navVersion: model.navVersion,
    );
  }
}

class PinInfoEntity {
 final int? pinLevel;
 final String? pinStatus;
 final bool? charging;

  PinInfoEntity({
    this.pinLevel,
    this.pinStatus,
    this.charging,
  });

  factory PinInfoEntity.fromModel(PinInfoModel model) {
    return PinInfoEntity(
      pinLevel: model.pinLevel,
      pinStatus: model.pinStatus,
      charging: model.charging,
    );
  }
}

class WifiInfoEntity {
 final String? ip;
 late String? ssid;
 late String? password;
 late String? wifiName;

  WifiInfoEntity({
    this.ip,
    this.ssid,
    this.password,
    this.wifiName,
  });

  factory WifiInfoEntity.fromModel(WifiModel model) {
    return WifiInfoEntity(
      ip: model.ip,
      wifiName: model.wifiName,
      ssid: model.wifiName,
    );
  }
}