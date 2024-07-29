import '../../../../../base/network/models/base_data.dart';
import '../../model/file_model.dart';

abstract class FileDataSource {
  Future<BaseData<List<FileModel>>> getListFile(String startTime, String endTime);
}