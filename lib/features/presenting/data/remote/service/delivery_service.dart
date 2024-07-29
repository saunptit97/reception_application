import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../../base/network/models/base_data.dart';
import '../../model/position_model.dart';
import '../../model/position_request.dart';
import '../../model/sensor_info_model.dart';
import '../../model/task_status_model.dart';

part 'delivery_service.g.dart';

@RestApi()
@injectable
abstract class DeliveryService {
  @factoryMethod
  factory DeliveryService(Dio dio) = _DeliveryService;

  @GET("/api/v1/get/list_positions")
  Future<BaseListData<PositionModel>> getListPosition();

  @POST("/api/v1/set/goto")
  Future<BaseData<dynamic>> setPositionGoTo(@Body() PositionRequest position);

  @GET("/api/v1/get/goto/status")
  Future<BaseData<TaskStatusModel>> getCurrentTaskStatus();

  @POST("/api/v1/cancel/goto")
  Future<BaseData<dynamic>> cancelCurrentTaskStatus();

  @GET("/api/v1/get/sensor_info")
  Future<BaseListData<SensorInfoModel>> getSensorStatus();
}