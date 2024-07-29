import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../../domain/entity/robot_info_entity.dart';

abstract class RobotInfoRepository {
  Future<Either<BaseError, RobotInfoEntity>> getRobotInfo();
  Future<Either<BaseError, WifiInfoEntity>> getWifiInfo();
  Future<Either<BaseError, PinInfoEntity>> getPinStatus();
}