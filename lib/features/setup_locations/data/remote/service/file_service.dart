import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../../../base/network/models/base_data.dart';
import '../../model/file_model.dart';

part 'file_service.g.dart';

@RestApi(
  baseUrl: "https://rec-robot-media.rikkei.org"
)
@injectable
abstract class FileService {
  @factoryMethod
  factory FileService(Dio dio) = _FileService;

  @GET("/api/v2/list/file")
  @Header('Content-Type: application/json')
  Future<BaseData<List<FileModel>>> getListFile( @Query('start_time') String startTime, @Query('end_time') String endTime);
}