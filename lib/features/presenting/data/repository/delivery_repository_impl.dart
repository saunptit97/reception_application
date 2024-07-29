import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:reception_application/base/network/errors/extension.dart';

import '../../../../base/network/errors/error.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../domain/entity/position_entity.dart';
import '../../domain/entity/sensor_info_entity.dart';
import '../../domain/entity/task_status_entity.dart';
import '../../domain/repository/delivery_repository.dart';
import '../model/position_request.dart';
import '../model/task_status_model.dart';
import '../remote/source/delivery_data_source.dart';

@Injectable(as: DeliveryRepository)
class DeliveryRepositoryImpl implements DeliveryRepository {
  DeliveryRepositoryImpl(this._deliveryDataSource);
  final DeliveryDataSource _deliveryDataSource;

  @override
  Future<Either<BaseError, TaskStatusEntity>> getCurrentTaskStatus() async {
    try {
      final result = await _deliveryDataSource.getCurrentTaskStatus();
      if (result.code == 0) {
        return right(
            TaskStatusEntity.fromModel(result.data ?? const TaskStatusModel()));
      }
      return left(BaseError.httpUnknownError(
          result.message ?? LocaleKeys.system_experiencing_an_error.tr()));
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<PositionEntity>>> getListPositions() async {
    try {
      final result = await _deliveryDataSource.getListPosition();
      if (result.code == 0) {
        return right(
            result.data?.map((e) => PositionEntity.fromModel(e)).toList() ??
                []);
      }
      return left(BaseError.httpUnknownError(
          result.message ?? LocaleKeys.system_experiencing_an_error.tr()));
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, bool>> setPositionGoTo(
      PositionRequest position) async {
    try {
      final result = await _deliveryDataSource.setPositionGoTo(position);
      if (result.code == 0) {
        return right(true);
      }
      return left(BaseError.httpUnknownError(
          result.message ?? LocaleKeys.system_experiencing_an_error.tr()));
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, bool>> cancelCurrentTaskStatus() async {
    try {
      final result = await _deliveryDataSource.cancelCurrentTaskStatus();
      if (result.code == 0) {
        return right(true);
      }
      return left(BaseError.httpUnknownError(
          result.message ?? LocaleKeys.system_experiencing_an_error.tr()));
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<SensorInfoEntity>>> getSensorStatus() async {
    try {
      final result = await _deliveryDataSource.getSensorStatus();
      if (result.code == 0) {
        return right(
            result.data?.map((e) => SensorInfoEntity.fromModel(e)).toList() ??
                []);
      }
      return left(BaseError.httpUnknownError(
          result.message ?? LocaleKeys.system_experiencing_an_error.tr()));
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
