import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../base/network/errors/error.dart';
import '../../data/model/position_request.dart';
import '../entity/position_entity.dart';
import '../entity/sensor_info_entity.dart';
import '../entity/task_status_entity.dart';
import '../repository/delivery_repository.dart';
import 'delivery_use_case.dart';

@Injectable(as: DeliveryUseCase)
class DeliveryUseCaseImpl implements DeliveryUseCase {
  final DeliveryRepository _deliveryRepository;

  DeliveryUseCaseImpl(this._deliveryRepository);

  @override
  Future<Either<BaseError, bool>> cancelCurrentTaskStatus() {
    return _deliveryRepository.cancelCurrentTaskStatus();
  }

  @override
  Future<Either<BaseError, TaskStatusEntity>> getCurrentTaskStatus() {
    return _deliveryRepository.getCurrentTaskStatus();
  }

  @override
  Future<Either<BaseError, List<PositionEntity>>> getListPositions() {
    return _deliveryRepository.getListPositions();
  }

  @override
  Future<Either<BaseError, bool>> setPositionGoTo(PositionRequest position) {
    return _deliveryRepository.setPositionGoTo(position);
  }

  @override
  Future<Either<BaseError, List<SensorInfoEntity>>> getSensorStatus() {
    return _deliveryRepository.getSensorStatus();
  }
}