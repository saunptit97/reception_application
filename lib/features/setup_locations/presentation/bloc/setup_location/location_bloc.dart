import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/bloc/base_bloc.dart';
import '../../../../../base/bloc/base_bloc_state.dart';
import '../../../../../base/bloc/bloc_status.dart';
import '../../../../presenting/data/model/position_model.dart';
import '../../../../presenting/domain/entity/position_entity.dart';
import '../../../../presenting/domain/use_case/delivery_use_case.dart';

part 'location_bloc.freezed.dart';
part 'location_bloc.g.dart';
part 'location_event.dart';
part 'location_state.dart';

@injectable
class LocationBloc extends BaseBloc<LocationEvent, LocationState> {
  LocationBloc(this._deliveryUseCase) : super(LocationState.init()) {
    on<LocationEvent>((LocationEvent event, Emitter<LocationState> emit) async {
      await event.when(
        showMessage: () => onShowMessage(emit),
        initData: () => onInitData(emit),
      );
    });
  }

  final DeliveryUseCase _deliveryUseCase;

  Future onShowMessage(Emitter<LocationState> emit) async {
    emit(state.copyWith(message: "Error"));
  }

  onInitData(Emitter<LocationState> emit) async {
    final result = await _deliveryUseCase.getListPositions();
    result.fold((l) {
      l.when(
        httpInternalServerError: (errorBody) {
          emit(state.copyWith(message: errorBody));
        },
        httpUnAuthorizedError: () => null,
        httpUnknownError: (message) {
          emit(state.copyWith(message: message));
        },
      );
    }, (r) {
      List<PositionEntity> waypoints = List.of([]);
      PositionEntity? productPosition;
      PositionEntity? chargingPosition;
      for (var waypoint in r) {
        if (waypoint.type == PositionType.production) {
          productPosition = waypoint;
        } else if (waypoint.type == PositionType.delivery) {
          waypoints.add(waypoint);
        } else if (waypoint.type == PositionType.charging) {
          chargingPosition = waypoint;
        }
      }
      emit(state.copyWith(
          waypoints: waypoints,
          productPosition: productPosition,
          chargingPosition: chargingPosition,
          status: BaseStateStatus.success));
    });
    emit(state.copyWith(status: BaseStateStatus.idle));
  }
}
