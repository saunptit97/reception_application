import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/base/network/errors/error.dart';
import 'package:reception_application/features/setup_locations/domain/entity/file_entity.dart';
import 'package:reception_application/features/setup_locations/domain/use_case/file_use_case.dart';

import '../repository/file_repository.dart';

@Injectable(as: FileUseCase)
class FileUseCaseImpl implements FileUseCase {
  final FileRepository _fileRepository;

  FileUseCaseImpl(this._fileRepository);
  @override
  Future<Either<BaseError, List<FileEntity>>> getListFile(
      String startTime, String endTime) {
    return _fileRepository.getListFile(startTime, endTime);
  }
}
