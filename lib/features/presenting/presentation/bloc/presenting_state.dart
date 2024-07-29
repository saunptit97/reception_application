part of 'presenting_bloc.dart';

@CopyWith()
class PresentingState extends BaseBlocState {
  final String? lastMessage;
  final List<PositionEntity>? waypoints;
  final int? currentWaypointIndex;
  final TaskStatusEntity? taskStatus;
  final PositionEntity? currentLocation;

  const PresentingState({
    required super.status,
    super.message,
    this.lastMessage,
    this.waypoints,
    this.currentWaypointIndex,
    this.taskStatus,
    this.currentLocation,
  });

  factory PresentingState.init() {
    return const PresentingState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, message, lastMessage, waypoints, currentWaypointIndex, taskStatus, currentLocation];
}
