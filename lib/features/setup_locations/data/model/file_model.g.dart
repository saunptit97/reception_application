// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileModelImpl _$$FileModelImplFromJson(Map<String, dynamic> json) =>
    _$FileModelImpl(
      fileId: (json['file_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      status: (json['status'] as num?)?.toInt(),
      url: json['url'] as String?,
      processingDate: json['processing_date'] as String?,
    );

Map<String, dynamic> _$$FileModelImplToJson(_$FileModelImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'name': instance.name,
      'status': instance.status,
      'url': instance.url,
      'processing_date': instance.processingDate,
    };
