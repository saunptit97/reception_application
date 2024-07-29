import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/base/network/errors/extension.dart';
import 'package:reception_application/features/presenting/data/model/text_to_speech_request.dart';
import 'package:reception_application/features/presenting/data/remote/source/speech_processing_source.dart';
import 'package:reception_application/features/presenting/domain/repository/speech_processing_repository.dart';

import '../../../../base/network/errors/error.dart';
import '../../domain/entity/text_entity.dart';
import '../model/text_model.dart';

@Injectable(as: SpeechProcessingRepository)
class SpeechProcessingRepositoryImpl implements SpeechProcessingRepository {
  SpeechProcessingRepositoryImpl(this._dataSource);
  final SpeechProcessingSource _dataSource;

  @override
  Future<Either<BaseError, TextEntity>> speechToText(File file) async {
    try {
      final result = await _dataSource.speechToText(file);
      final data = TextEntity.fromModel(result.data ?? const TextModel());
      return right(data);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, AudioEntity>> textToSpeech(
      String audio, String language) async {
    try {
      final result = await _dataSource
          .textToSpeech(TextToSpeechRequest(text: audio, language: language));
      final data = AudioEntity.fromModel(result.data ?? const AudioModel());
      return right(data);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
