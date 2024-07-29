// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showMessage,
    required TResult Function() initData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showMessage,
    TResult? Function()? initData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showMessage,
    TResult Function()? initData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowMessage value) showMessage,
    required TResult Function(OnInitData value) initData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowMessage value)? showMessage,
    TResult? Function(OnInitData value)? initData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowMessage value)? showMessage,
    TResult Function(OnInitData value)? initData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationEventCopyWith<$Res> {
  factory $LocationEventCopyWith(
          LocationEvent value, $Res Function(LocationEvent) then) =
      _$LocationEventCopyWithImpl<$Res, LocationEvent>;
}

/// @nodoc
class _$LocationEventCopyWithImpl<$Res, $Val extends LocationEvent>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShowMessageImplCopyWith<$Res> {
  factory _$$ShowMessageImplCopyWith(
          _$ShowMessageImpl value, $Res Function(_$ShowMessageImpl) then) =
      __$$ShowMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowMessageImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$ShowMessageImpl>
    implements _$$ShowMessageImplCopyWith<$Res> {
  __$$ShowMessageImplCopyWithImpl(
      _$ShowMessageImpl _value, $Res Function(_$ShowMessageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowMessageImpl implements ShowMessage {
  const _$ShowMessageImpl();

  @override
  String toString() {
    return 'LocationEvent.showMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowMessageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showMessage,
    required TResult Function() initData,
  }) {
    return showMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showMessage,
    TResult? Function()? initData,
  }) {
    return showMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showMessage,
    TResult Function()? initData,
    required TResult orElse(),
  }) {
    if (showMessage != null) {
      return showMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowMessage value) showMessage,
    required TResult Function(OnInitData value) initData,
  }) {
    return showMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowMessage value)? showMessage,
    TResult? Function(OnInitData value)? initData,
  }) {
    return showMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowMessage value)? showMessage,
    TResult Function(OnInitData value)? initData,
    required TResult orElse(),
  }) {
    if (showMessage != null) {
      return showMessage(this);
    }
    return orElse();
  }
}

abstract class ShowMessage implements LocationEvent {
  const factory ShowMessage() = _$ShowMessageImpl;
}

/// @nodoc
abstract class _$$OnInitDataImplCopyWith<$Res> {
  factory _$$OnInitDataImplCopyWith(
          _$OnInitDataImpl value, $Res Function(_$OnInitDataImpl) then) =
      __$$OnInitDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnInitDataImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$OnInitDataImpl>
    implements _$$OnInitDataImplCopyWith<$Res> {
  __$$OnInitDataImplCopyWithImpl(
      _$OnInitDataImpl _value, $Res Function(_$OnInitDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnInitDataImpl implements OnInitData {
  const _$OnInitDataImpl();

  @override
  String toString() {
    return 'LocationEvent.initData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnInitDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showMessage,
    required TResult Function() initData,
  }) {
    return initData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showMessage,
    TResult? Function()? initData,
  }) {
    return initData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showMessage,
    TResult Function()? initData,
    required TResult orElse(),
  }) {
    if (initData != null) {
      return initData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowMessage value) showMessage,
    required TResult Function(OnInitData value) initData,
  }) {
    return initData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowMessage value)? showMessage,
    TResult? Function(OnInitData value)? initData,
  }) {
    return initData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowMessage value)? showMessage,
    TResult Function(OnInitData value)? initData,
    required TResult orElse(),
  }) {
    if (initData != null) {
      return initData(this);
    }
    return orElse();
  }
}

abstract class OnInitData implements LocationEvent {
  const factory OnInitData() = _$OnInitDataImpl;
}
