import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../base/network/errors/error.dart';
import '../entity/text_entity.dart';

abstract class SpeechUseCase {
  Future<Either<BaseError, TextEntity>> speechToText(File file);
  Future<Either<BaseError, AudioEntity>> textToSpeech(String audio, String language);
}