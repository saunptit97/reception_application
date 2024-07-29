import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_info_model.freezed.dart';
part 'sensor_info_model.g.dart';

@JsonEnum()
enum SensorInfoStatus {
  @JsonValue(1)
  live,
  @JsonValue(0)
  die,
}

extension SensorInfoStatusExtension on SensorInfoStatus {
  int get name {
    switch (this) {
      case SensorInfoStatus.live:
        return 1;
      case SensorInfoStatus.die:
        return 0;
      default:
        return -1;
    }
  }
}

@freezed
class SensorInfoModel with _$SensorInfoModel {
  const factory SensorInfoModel({
    String? id,
    String? name,
    SensorInfoStatus? status,
    double? value,
  }) = _SensorInfoModel;

  factory SensorInfoModel.fromJson(Map<String, dynamic> json) => _$SensorInfoModelFromJson(json);
}

