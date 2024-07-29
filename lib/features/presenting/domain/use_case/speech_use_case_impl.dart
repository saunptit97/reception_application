import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/base/network/errors/error.dart';
import 'package:reception_application/features/presenting/domain/entity/text_entity.dart';
import 'package:reception_application/features/presenting/domain/use_case/speech_use_case.dart';

import '../repository/speech_processing_repository.dart';

@Injectable(as: SpeechUseCase)
class SpeechUseCaseImpl implements SpeechUseCase {
  final SpeechProcessingRepository _speechRepository;

  SpeechUseCaseImpl(this._speechRepository);

  @override
  Future<Either<BaseError, TextEntity>> speechToText(File file) {
    return _speechRepository.speechToText(file);
  }

  @override
  Future<Either<BaseError, AudioEntity>> textToSpeech(
      String audio, String language) {
    return _speechRepository.textToSpeech(audio, language);
  }
}
