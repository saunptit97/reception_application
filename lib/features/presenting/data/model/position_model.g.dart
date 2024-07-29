// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionModelImpl _$$PositionModelImplFromJson(Map<String, dynamic> json) =>
    _$PositionModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: $enumDecodeNullable(_$PositionTypeEnumMap, json['id_type']),
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      angle: (json['angle'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PositionModelImplToJson(_$PositionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'id_type': _$PositionTypeEnumMap[instance.type],
      'x': instance.x,
      'y': instance.y,
      'angle': instance.angle,
    };

const _$PositionTypeEnumMap = {
  PositionType.production: 0,
  PositionType.charging: 1,
  PositionType.delivery: 2,
  PositionType.rest: 3,
};
