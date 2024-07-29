// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextModelImpl _$$TextModelImplFromJson(Map<String, dynamic> json) =>
    _$TextModelImpl(
      fullText: json['full_text'] as String?,
    );

Map<String, dynamic> _$$TextModelImplToJson(_$TextModelImpl instance) =>
    <String, dynamic>{
      'full_text': instance.fullText,
    };

_$AudioModelImpl _$$AudioModelImplFromJson(Map<String, dynamic> json) =>
    _$AudioModelImpl(
      audio: (json['audio'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$AudioModelImplToJson(_$AudioModelImpl instance) =>
    <String, dynamic>{
      'audio': instance.audio,
    };

_$RobotModelImpl _$$RobotModelImplFromJson(Map<String, dynamic> json) =>
    _$RobotModelImpl(
      sessionId: json['session_id'] as String?,
      robotId: json['robot_id'] as String?,
      data: json['data'] == null
          ? null
          : ChatBotModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RobotModelImplToJson(_$RobotModelImpl instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'robot_id': instance.robotId,
      'data': instance.data,
    };

_$ChatBotModelImpl _$$ChatBotModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatBotModelImpl(
      intent: json['intent'] as String?,
      response: json['text'] as String?,
      index: (json['index'] as num?)?.toInt(),
      entity: json['entity'],
    );

Map<String, dynamic> _$$ChatBotModelImplToJson(_$ChatBotModelImpl instance) =>
    <String, dynamic>{
      'intent': instance.intent,
      'text': instance.response,
      'index': instance.index,
      'entity': instance.entity,
    };
