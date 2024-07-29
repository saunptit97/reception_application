import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/network/errors/error.dart';
import '../entity/robot_info_entity.dart';
import '../repository/robot_info_repository.dart';
import 'robot_info_use_case.dart';

@Injectable(as: RobotInfoUseCase)
class RobotInfoUseCaseImpl implements RobotInfoUseCase {
  final RobotInfoRepository _robotInfoRepository;
  RobotInfoUseCaseImpl(this._robotInfoRepository);

  @override
  Future<Either<BaseError, PinInfoEntity>> getPinStatus() {
    return _robotInfoRepository.getPinStatus();
  }

  @override
  Future<Either<BaseError, RobotInfoEntity>> getRobotInfo() {
    return _robotInfoRepository.getRobotInfo();
  }

  @override
  Future<Either<BaseError, WifiInfoEntity>> getWifiInfo() {
    return _robotInfoRepository.getWifiInfo();
  }
}