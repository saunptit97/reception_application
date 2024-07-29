part of 'location_bloc.dart';

@CopyWith()
class LocationState extends BaseBlocState {

  final List<PositionEntity>? waypoints;
  final PositionEntity? productPosition;
  final PositionEntity? chargingPosition;

  const LocationState({
    required super.status,
    super.message,
    this.waypoints,
    this.productPosition,
    this.chargingPosition,
  });

  factory LocationState.init() {
    return const LocationState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, waypoints, productPosition, chargingPosition];
}
