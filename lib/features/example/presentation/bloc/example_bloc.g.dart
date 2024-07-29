// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExampleStateCWProxy {
  ExampleState status(BaseStateStatus status);

  ExampleState message(String? message);

  ExampleState players(List<PlayerEntity> players);

  ExampleState attribute(Option<String>? attribute);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExampleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExampleState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExampleState call({
    BaseStateStatus? status,
    String? message,
    List<PlayerEntity>? players,
    Option<String>? attribute,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExampleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExampleState.copyWith.fieldName(...)`
class _$ExampleStateCWProxyImpl implements _$ExampleStateCWProxy {
  const _$ExampleStateCWProxyImpl(this._value);

  final ExampleState _value;

  @override
  ExampleState status(BaseStateStatus status) => this(status: status);

  @override
  ExampleState message(String? message) => this(message: message);

  @override
  ExampleState players(List<PlayerEntity> players) => this(players: players);

  @override
  ExampleState attribute(Option<String>? attribute) =>
      this(attribute: attribute);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExampleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExampleState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExampleState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? players = const $CopyWithPlaceholder(),
    Object? attribute = const $CopyWithPlaceholder(),
  }) {
    return ExampleState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      players: players == const $CopyWithPlaceholder() || players == null
          ? _value.players
          // ignore: cast_nullable_to_non_nullable
          : players as List<PlayerEntity>,
      attribute: attribute == const $CopyWithPlaceholder()
          ? _value.attribute
          // ignore: cast_nullable_to_non_nullable
          : attribute as Option<String>?,
    );
  }
}

extension $ExampleStateCopyWith on ExampleState {
  /// Returns a callable class that can be used as follows: `instanceOfExampleState.copyWith(...)` or like so:`instanceOfExampleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExampleStateCWProxy get copyWith => _$ExampleStateCWProxyImpl(this);
}
