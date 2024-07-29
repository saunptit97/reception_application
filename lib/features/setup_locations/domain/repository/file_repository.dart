import 'package:dartz/dartz.dart';
import 'package:reception_application/base/network/errors/error.dart';
import 'package:reception_application/features/setup_locations/domain/entity/file_entity.dart';

abstract class FileRepository {
  Future<Either<BaseError, List<FileEntity>>> getListFile(
      String startTime, String endTime);
}
