import 'package:injectable/injectable.dart';
import 'package:reception_application/base/network/models/base_data.dart';
import 'package:reception_application/features/setup_locations/data/model/file_model.dart';
import 'package:reception_application/features/setup_locations/data/remote/service/file_service.dart';
import 'package:reception_application/features/setup_locations/data/remote/source/file_data_source.dart';

@Injectable(as: FileDataSource)
class FileDataSourceImpl implements FileDataSource {
  FileDataSourceImpl(this._fileService);
  final FileService _fileService;

  @override
  Future<BaseData<List<FileModel>>> getListFile(
      String startTime, String endTime) {
    return _fileService.getListFile(startTime, endTime);
  }
}
