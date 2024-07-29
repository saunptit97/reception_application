// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SensorInfoModelImpl _$$SensorInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SensorInfoModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: $enumDecodeNullable(_$SensorInfoStatusEnumMap, json['status']),
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SensorInfoModelImplToJson(
        _$SensorInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$SensorInfoStatusEnumMap[instance.status],
      'value': instance.value,
    };

const _$SensorInfoStatusEnumMap = {
  SensorInfoStatus.live: 1,
  SensorInfoStatus.die: 0,
};
