import '../../../../../base/network/models/base_data.dart';
import '../../model/position_model.dart';
import '../../model/position_request.dart';
import '../../model/sensor_info_model.dart';
import '../../model/task_status_model.dart';

abstract class DeliveryDataSource {
  Future<BaseListData<PositionModel>> getListPosition();
  Future<BaseData<dynamic>> setPositionGoTo(PositionRequest position);
  Future<BaseData<TaskStatusModel>> getCurrentTaskStatus();
  Future<BaseData<dynamic>> cancelCurrentTaskStatus();
  Future<BaseListData<SensorInfoModel>> getSensorStatus();
}