// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_media_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelectMediaStateCWProxy {
  SelectMediaState status(BaseStateStatus status);

  SelectMediaState message(String? message);

  SelectMediaState files(List<FileEntity>? files);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectMediaState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectMediaState(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectMediaState call({
    BaseStateStatus? status,
    String? message,
    List<FileEntity>? files,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSelectMediaState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSelectMediaState.copyWith.fieldName(...)`
class _$SelectMediaStateCWProxyImpl implements _$SelectMediaStateCWProxy {
  const _$SelectMediaStateCWProxyImpl(this._value);

  final SelectMediaState _value;

  @override
  SelectMediaState status(BaseStateStatus status) => this(status: status);

  @override
  SelectMediaState message(String? message) => this(message: message);

  @override
  SelectMediaState files(List<FileEntity>? files) => this(files: files);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectMediaState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectMediaState(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectMediaState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? files = const $CopyWithPlaceholder(),
  }) {
    return SelectMediaState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      files: files == const $CopyWithPlaceholder()
          ? _value.files
          // ignore: cast_nullable_to_non_nullable
          : files as List<FileEntity>?,
    );
  }
}

extension $SelectMediaStateCopyWith on SelectMediaState {
  /// Returns a callable class that can be used as follows: `instanceOfSelectMediaState.copyWith(...)` or like so:`instanceOfSelectMediaState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelectMediaStateCWProxy get copyWith => _$SelectMediaStateCWProxyImpl(this);
}
