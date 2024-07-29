import 'package:injectable/injectable.dart';
import '../../../../../base/network/models/base_data.dart';
import '../../model/pin_info_model.dart';
import '../../model/robot_info_model.dart';
import '../../model/wifi_model.dart';
import '../service/robot_info_service.dart';
import 'robot_info_data_source.dart';

@Injectable(as: RobotInfoDataSource)
class RobotInfoDataSourceImpl implements RobotInfoDataSource {
  final RobotInfoService _infoService;

  RobotInfoDataSourceImpl(this._infoService);

  @override
  Future<BaseData<PinInfoModel>> getPinInfo() {
    return _infoService.getPinInfo();
  }

  @override
  Future<BaseData<RobotInfoModel>> getRobotInfo() {
    return _infoService.getRobotInfo();
  }

  @override
  Future<BaseData<WifiModel>> getWifiInfo() {
    return _infoService.getWifiInfo();
  }

}