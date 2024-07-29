import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../../../base/network/models/base_data.dart';
import '../../../../../common/logger/dio_logger.dart';
import '../../model/text_model.dart';
import '../../model/text_to_speech_request.dart';


part 'speech_processing_service.g.dart';

@RestApi()
@injectable
abstract class SpeechProcessingService {
  @factoryMethod
  factory SpeechProcessingService(Dio dio) = _SpeechProcessingService;

  // @Header('Content-Type: multipart/form-data')
  @POST("/api/v1/upload/audio")
  @MultiPart()
  Future<BaseData<TextModel>> speechToText(@Part(name: "audio") File file, @Part(name: "language") String language, @Part(name: "session_id") String sessionId );

  @POST("/api/v1/request/audio")
  Future<BaseData<AudioModel>> textToSpeech(@Body() TextToSpeechRequest request);
}