import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../entity/file_entity.dart';

abstract class FileUseCase {
  Future<Either<BaseError, List<FileEntity>>> getListFile(String startTime, String endTime);
}