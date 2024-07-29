import 'package:dartz/dartz.dart';
import '../../../../base/network/errors/error.dart';
import '../../data/model/position_request.dart';
import '../entity/position_entity.dart';
import '../entity/sensor_info_entity.dart';
import '../entity/task_status_entity.dart';

abstract class DeliveryRepository {
  Future<Either<BaseError, List<PositionEntity>>> getListPositions();
  Future<Either<BaseError, bool>> setPositionGoTo(PositionRequest position);
  Future<Either<BaseError, TaskStatusEntity>> getCurrentTaskStatus();
  Future<Either<BaseError, bool>> cancelCurrentTaskStatus();
  Future<Either<BaseError, List<SensorInfoEntity>>> getSensorStatus();
}