import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:reception_application/base/network/models/base_data.dart';
import 'package:reception_application/features/presenting/data/model/text_model.dart';
import 'package:reception_application/features/presenting/data/model/text_to_speech_request.dart';
import 'package:reception_application/features/presenting/data/remote/service/speech_processing_service.dart';
import 'package:reception_application/features/presenting/data/remote/source/speech_processing_source.dart';

@Injectable(as: SpeechProcessingSource)
class SpeechProcessingSourceImpl extends SpeechProcessingSource {
  final SpeechProcessingService speechProcessingService;

  SpeechProcessingSourceImpl({required this.speechProcessingService});

  @override
  Future<BaseData<TextModel>> speechToText(File file) {
    return speechProcessingService.speechToText(file, "vi", "1234");
  }

  @override
  Future<BaseData<AudioModel>> textToSpeech(TextToSpeechRequest request) {
    return speechProcessingService.textToSpeech(request);
  }
}
