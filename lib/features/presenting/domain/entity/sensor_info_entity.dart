import '../../data/model/sensor_info_model.dart';

class SensorInfoEntity {
  final String? id;
  final String? name;
  final SensorInfoStatus? status;
  final double? value;

  SensorInfoEntity({
    this.id,
    this.name,
    this.status,
    this.value,
  });

  factory SensorInfoEntity.fromModel(SensorInfoModel model) {
    return SensorInfoEntity(
      id: model.id,
      name: model.name,
      status: model.status,
      value: model.value,
    );
  }
}
