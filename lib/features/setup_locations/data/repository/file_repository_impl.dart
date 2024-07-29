import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/base/network/errors/error.dart';
import 'package:reception_application/base/network/errors/extension.dart';
import 'package:reception_application/features/setup_locations/domain/entity/file_entity.dart';
import 'package:reception_application/features/setup_locations/domain/repository/file_repository.dart';

import '../../../../gen/locale_keys.g.dart';
import '../remote/source/file_data_source.dart';

@Injectable(as: FileRepository)
class FileRepositoryImpl implements FileRepository {
  FileRepositoryImpl(this._fileDataSource);
  final FileDataSource _fileDataSource;

  @override
  Future<Either<BaseError, List<FileEntity>>> getListFile(
      String startTime, String endTime) async {
    try {
      final result = await _fileDataSource.getListFile(startTime, endTime);
      if (result.code == 0) {
        return right(
            result.data?.map((e) => FileEntity.fromModel(e)).toList() ?? []);
      }
      return left(BaseError.httpUnknownError(
          result.message ?? LocaleKeys.system_experiencing_an_error.tr()));
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
