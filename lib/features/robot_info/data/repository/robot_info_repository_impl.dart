import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/base/network/errors/extension.dart';

import '../../../../base/network/errors/error.dart';
import '../../domain/entity/robot_info_entity.dart';
import '../../domain/repository/robot_info_repository.dart';
import '../model/pin_info_model.dart';
import '../model/robot_info_model.dart';
import '../model/wifi_model.dart';
import '../remote/source/robot_info_data_source.dart';

@Injectable(as: RobotInfoRepository)
class RobotInfoRepositoryImpl implements RobotInfoRepository {
  RobotInfoRepositoryImpl(this._dataSource);
  final RobotInfoDataSource _dataSource;

  @override
  Future<Either<BaseError, PinInfoEntity>> getPinStatus() async {
    try {
      final result = await _dataSource.getPinInfo();
      final data = PinInfoEntity.fromModel(result.data ?? const PinInfoModel());
      return right(data);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, RobotInfoEntity>> getRobotInfo() async {
    try {
      final result = await _dataSource.getRobotInfo();
      final data =
          RobotInfoEntity.fromModel(result.data ?? const RobotInfoModel());
      return right(data);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, WifiInfoEntity>> getWifiInfo() async {
    try {
      final result = await _dataSource.getWifiInfo();
      final data = WifiInfoEntity.fromModel(result.data ?? const WifiModel());
      return right(data);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
