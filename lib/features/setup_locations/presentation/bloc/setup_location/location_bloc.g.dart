// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LocationStateCWProxy {
  LocationState status(BaseStateStatus status);

  LocationState message(String? message);

  LocationState waypoints(List<PositionEntity>? waypoints);

  LocationState productPosition(PositionEntity? productPosition);

  LocationState chargingPosition(PositionEntity? chargingPosition);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LocationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LocationState(...).copyWith(id: 12, name: "My name")
  /// ````
  LocationState call({
    BaseStateStatus? status,
    String? message,
    List<PositionEntity>? waypoints,
    PositionEntity? productPosition,
    PositionEntity? chargingPosition,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLocationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLocationState.copyWith.fieldName(...)`
class _$LocationStateCWProxyImpl implements _$LocationStateCWProxy {
  const _$LocationStateCWProxyImpl(this._value);

  final LocationState _value;

  @override
  LocationState status(BaseStateStatus status) => this(status: status);

  @override
  LocationState message(String? message) => this(message: message);

  @override
  LocationState waypoints(List<PositionEntity>? waypoints) =>
      this(waypoints: waypoints);

  @override
  LocationState productPosition(PositionEntity? productPosition) =>
      this(productPosition: productPosition);

  @override
  LocationState chargingPosition(PositionEntity? chargingPosition) =>
      this(chargingPosition: chargingPosition);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LocationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LocationState(...).copyWith(id: 12, name: "My name")
  /// ````
  LocationState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? waypoints = const $CopyWithPlaceholder(),
    Object? productPosition = const $CopyWithPlaceholder(),
    Object? chargingPosition = const $CopyWithPlaceholder(),
  }) {
    return LocationState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      waypoints: waypoints == const $CopyWithPlaceholder()
          ? _value.waypoints
          // ignore: cast_nullable_to_non_nullable
          : waypoints as List<PositionEntity>?,
      productPosition: productPosition == const $CopyWithPlaceholder()
          ? _value.productPosition
          // ignore: cast_nullable_to_non_nullable
          : productPosition as PositionEntity?,
      chargingPosition: chargingPosition == const $CopyWithPlaceholder()
          ? _value.chargingPosition
          // ignore: cast_nullable_to_non_nullable
          : chargingPosition as PositionEntity?,
    );
  }
}

extension $LocationStateCopyWith on LocationState {
  /// Returns a callable class that can be used as follows: `instanceOfLocationState.copyWith(...)` or like so:`instanceOfLocationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LocationStateCWProxy get copyWith => _$LocationStateCWProxyImpl(this);
}
