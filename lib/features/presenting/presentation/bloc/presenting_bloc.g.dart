// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presenting_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PresentingStateCWProxy {
  PresentingState status(BaseStateStatus status);

  PresentingState message(String? message);

  PresentingState lastMessage(String? lastMessage);

  PresentingState waypoints(List<PositionEntity>? waypoints);

  PresentingState currentWaypointIndex(int? currentWaypointIndex);

  PresentingState taskStatus(TaskStatusEntity? taskStatus);

  PresentingState currentLocation(PositionEntity? currentLocation);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresentingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresentingState(...).copyWith(id: 12, name: "My name")
  /// ````
  PresentingState call({
    BaseStateStatus? status,
    String? message,
    String? lastMessage,
    List<PositionEntity>? waypoints,
    int? currentWaypointIndex,
    TaskStatusEntity? taskStatus,
    PositionEntity? currentLocation,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPresentingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPresentingState.copyWith.fieldName(...)`
class _$PresentingStateCWProxyImpl implements _$PresentingStateCWProxy {
  const _$PresentingStateCWProxyImpl(this._value);

  final PresentingState _value;

  @override
  PresentingState status(BaseStateStatus status) => this(status: status);

  @override
  PresentingState message(String? message) => this(message: message);

  @override
  PresentingState lastMessage(String? lastMessage) =>
      this(lastMessage: lastMessage);

  @override
  PresentingState waypoints(List<PositionEntity>? waypoints) =>
      this(waypoints: waypoints);

  @override
  PresentingState currentWaypointIndex(int? currentWaypointIndex) =>
      this(currentWaypointIndex: currentWaypointIndex);

  @override
  PresentingState taskStatus(TaskStatusEntity? taskStatus) =>
      this(taskStatus: taskStatus);

  @override
  PresentingState currentLocation(PositionEntity? currentLocation) =>
      this(currentLocation: currentLocation);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresentingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresentingState(...).copyWith(id: 12, name: "My name")
  /// ````
  PresentingState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? lastMessage = const $CopyWithPlaceholder(),
    Object? waypoints = const $CopyWithPlaceholder(),
    Object? currentWaypointIndex = const $CopyWithPlaceholder(),
    Object? taskStatus = const $CopyWithPlaceholder(),
    Object? currentLocation = const $CopyWithPlaceholder(),
  }) {
    return PresentingState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      lastMessage: lastMessage == const $CopyWithPlaceholder()
          ? _value.lastMessage
          // ignore: cast_nullable_to_non_nullable
          : lastMessage as String?,
      waypoints: waypoints == const $CopyWithPlaceholder()
          ? _value.waypoints
          // ignore: cast_nullable_to_non_nullable
          : waypoints as List<PositionEntity>?,
      currentWaypointIndex: currentWaypointIndex == const $CopyWithPlaceholder()
          ? _value.currentWaypointIndex
          // ignore: cast_nullable_to_non_nullable
          : currentWaypointIndex as int?,
      taskStatus: taskStatus == const $CopyWithPlaceholder()
          ? _value.taskStatus
          // ignore: cast_nullable_to_non_nullable
          : taskStatus as TaskStatusEntity?,
      currentLocation: currentLocation == const $CopyWithPlaceholder()
          ? _value.currentLocation
          // ignore: cast_nullable_to_non_nullable
          : currentLocation as PositionEntity?,
    );
  }
}

extension $PresentingStateCopyWith on PresentingState {
  /// Returns a callable class that can be used as follows: `instanceOfPresentingState.copyWith(...)` or like so:`instanceOfPresentingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PresentingStateCWProxy get copyWith => _$PresentingStateCWProxyImpl(this);
}
