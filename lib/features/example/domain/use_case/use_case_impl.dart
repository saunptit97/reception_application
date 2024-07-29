import 'package:reception_application/base/network/errors/error.dart';
import 'package:reception_application/features/example/domain/repository/core_repository.dart';
import 'package:reception_application/features/example/domain/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity/player/player_entity.dart';

@Injectable(as: ExampleUseCase)
class ExampleUseCaseImpl implements ExampleUseCase {
  ExampleUseCaseImpl(this._coreRepo);

  final ExampleRepo _coreRepo;

  @override
  Future<Either<BaseError, List<PlayerEntity>>> getData({
    required int offset,
    required int limit,
  }) {
    return _coreRepo.getData(offset: offset, limit: limit);
  }
}
