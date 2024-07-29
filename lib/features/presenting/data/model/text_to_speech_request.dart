import 'package:freezed_annotation/freezed_annotation.dart';
part 'text_to_speech_request.freezed.dart';
part 'text_to_speech_request.g.dart';

@freezed
class TextToSpeechRequest with _$TextToSpeechRequest {
  const factory TextToSpeechRequest({
    @JsonKey(name: "text") String? text,
    @JsonKey(name: "language") String? language,
  }) = _TextToSpeechRequestl;

  factory TextToSpeechRequest.fromJson(Map<String, dynamic> json) => _$TextToSpeechRequestFromJson(json);
}