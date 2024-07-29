import '../../../../../base/network/models/base_data.dart';
import '../../model/pin_info_model.dart';
import '../../model/robot_info_model.dart';
import '../../model/wifi_model.dart';

abstract class RobotInfoDataSource {
  Future<BaseData<RobotInfoModel>> getRobotInfo();
  Future<BaseData<WifiModel>> getWifiInfo();
  Future<BaseData<PinInfoModel>> getPinInfo();
}