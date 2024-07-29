import 'package:freezed_annotation/freezed_annotation.dart';
part 'text_model.freezed.dart';
part 'text_model.g.dart';

@freezed
class TextModel with _$TextModel {
  const factory TextModel({
    @JsonKey(name: "full_text") String? fullText,
  }) = _TextModel;

  factory TextModel.fromJson(Map<String, dynamic> json) => _$TextModelFromJson(json);
}

@freezed
class AudioModel with _$AudioModel {
  const factory AudioModel({
    @JsonKey(name: "audio") List<int>? audio,
  }) = _AudioModel;

  factory AudioModel.fromJson(Map<String, dynamic> json) => _$AudioModelFromJson(json);
}

@freezed
class RobotModel with _$RobotModel {
  const factory RobotModel({
    @JsonKey(name: "session_id") String? sessionId,
    @JsonKey(name: "robot_id") String? robotId,
    @JsonKey(name: "data") ChatBotModel? data,
  }) = _RobotModel;

  factory RobotModel.fromJson(Map<String, dynamic> json) => _$RobotModelFromJson(json);
}

@freezed
class ChatBotModel with _$ChatBotModel {
  const factory ChatBotModel({
    @JsonKey(name: "intent") String? intent,
    @JsonKey(name: "text") String? response,
    @JsonKey(name: "index") int? index,
    @JsonKey(name: "entity") dynamic entity,
  }) = _ChatBotModel;

  factory ChatBotModel.fromJson(Map<String, dynamic> json) => _$ChatBotModelFromJson(json);
}
