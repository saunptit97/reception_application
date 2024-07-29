import 'package:injectable/injectable.dart';
import '../../../../../base/network/models/base_data.dart';
import '../../model/position_model.dart';
import '../../model/position_request.dart';
import '../../model/sensor_info_model.dart';
import '../../model/task_status_model.dart';
import '../service/delivery_service.dart';
import 'delivery_data_source.dart';

@Injectable(as: DeliveryDataSource)
class DeliveryDataSourceImpl implements DeliveryDataSource {

  DeliveryDataSourceImpl(this._deliveryService);
  final DeliveryService _deliveryService;

  @override
  Future<BaseData> cancelCurrentTaskStatus() {
    return _deliveryService.cancelCurrentTaskStatus();
  }

  @override
  Future<BaseData<TaskStatusModel>> getCurrentTaskStatus() {
    return _deliveryService.getCurrentTaskStatus();
  }

  @override
  Future<BaseListData<PositionModel>> getListPosition() {
    return _deliveryService.getListPosition();
  }

  @override
  Future<BaseData> setPositionGoTo(PositionRequest position) {
    return _deliveryService.setPositionGoTo(position);
  }

  @override
  Future<BaseListData<SensorInfoModel>> getSensorStatus() {
    return _deliveryService.getSensorStatus();
  }

}