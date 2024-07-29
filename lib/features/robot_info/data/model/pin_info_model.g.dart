// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PinInfoModelImpl _$$PinInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$PinInfoModelImpl(
      pinLevel: (json['pin_level'] as num?)?.toInt(),
      pinStatus: json['pin_status'] as String?,
      charging: json['charging'] as bool?,
    );

Map<String, dynamic> _$$PinInfoModelImplToJson(_$PinInfoModelImpl instance) =>
    <String, dynamic>{
      'pin_level': instance.pinLevel,
      'pin_status': instance.pinStatus,
      'charging': instance.charging,
    };
