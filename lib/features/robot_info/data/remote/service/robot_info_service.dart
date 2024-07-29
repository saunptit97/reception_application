import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../../base/network/models/base_data.dart';
import '../../model/pin_info_model.dart';
import '../../model/robot_info_model.dart';
import '../../model/wifi_model.dart';

part 'robot_info_service.g.dart';

@RestApi()
@injectable
abstract class RobotInfoService {
  @factoryMethod
  factory RobotInfoService(Dio dio) = _RobotInfoService;

  @GET("/api/v1/get/robot_info")
  Future<BaseData<RobotInfoModel>> getRobotInfo();

  @GET("/api/v1/get/wifi")
  Future<BaseData<WifiModel>> getWifiInfo();

  @GET("/api/v1/get/pin_info")
  Future<BaseData<PinInfoModel>> getPinInfo();
}