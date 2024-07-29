import 'dart:io';

import 'package:reception_application/features/presenting/data/model/text_to_speech_request.dart';

import '../../../../../base/network/models/base_data.dart';
import '../../model/text_model.dart';

abstract class SpeechProcessingSource {
  Future<BaseData<TextModel>> speechToText(File file);
  Future<BaseData<AudioModel>> textToSpeech(TextToSpeechRequest request);
}
