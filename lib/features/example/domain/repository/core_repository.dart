import 'package:reception_application/base/network/errors/error.dart';
import 'package:reception_application/features/example/domain/entity/player/player_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ExampleRepo {
  Future<Either<BaseError, List<PlayerEntity>>> getData({
    required int offset,
    required int limit,
  });
}
