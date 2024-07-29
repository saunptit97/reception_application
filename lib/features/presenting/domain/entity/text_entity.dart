import 'package:reception_application/features/presenting/data/model/text_model.dart';

class TextEntity {
  final String? fullText;

  TextEntity({
    this.fullText,
  });

  factory TextEntity.fromModel(TextModel model) {
    return TextEntity(
      fullText: model.fullText,
    );
  }
}

class AudioEntity {
  final List<int>? audio;

  AudioEntity({
    this.audio,
  });

  factory AudioEntity.fromModel(AudioModel model) {
    return AudioEntity(
      audio: model.audio,
    );
  }
}
