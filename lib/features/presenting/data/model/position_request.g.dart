// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionRequestImpl _$$PositionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PositionRequestImpl(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      angle: (json['angle'] as num?)?.toDouble(),
      name: json['name'] as String?,
      id: json['id'] as String?,
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PositionRequestImplToJson(
        _$PositionRequestImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'angle': instance.angle,
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
    };
