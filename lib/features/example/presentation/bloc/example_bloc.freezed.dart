// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExampleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getData,
    required TResult Function() showMessage,
    required TResult Function(List<PlayerEntity> players, int offset)
        getPlayers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getData,
    TResult? Function()? showMessage,
    TResult? Function(List<PlayerEntity> players, int offset)? getPlayers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getData,
    TResult Function()? showMessage,
    TResult Function(List<PlayerEntity> players, int offset)? getPlayers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetData value) getData,
    required TResult Function(ShowMessage value) showMessage,
    required TResult Function(GetPlayers value) getPlayers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetData value)? getData,
    TResult? Function(ShowMessage value)? showMessage,
    TResult? Function(GetPlayers value)? getPlayers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetData value)? getData,
    TResult Function(ShowMessage value)? showMessage,
    TResult Function(GetPlayers value)? getPlayers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleEventCopyWith<$Res> {
  factory $ExampleEventCopyWith(
          ExampleEvent value, $Res Function(ExampleEvent) then) =
      _$ExampleEventCopyWithImpl<$Res, ExampleEvent>;
}

/// @nodoc
class _$ExampleEventCopyWithImpl<$Res, $Val extends ExampleEvent>
    implements $ExampleEventCopyWith<$Res> {
  _$ExampleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetDataImplCopyWith<$Res> {
  factory _$$GetDataImplCopyWith(
          _$GetDataImpl value, $Res Function(_$GetDataImpl) then) =
      __$$GetDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDataImplCopyWithImpl<$Res>
    extends _$ExampleEventCopyWithImpl<$Res, _$GetDataImpl>
    implements _$$GetDataImplCopyWith<$Res> {
  __$$GetDataImplCopyWithImpl(
      _$GetDataImpl _value, $Res Function(_$GetDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDataImpl implements GetData {
  const _$GetDataImpl();

  @override
  String toString() {
    return 'ExampleEvent.getData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getData,
    required TResult Function() showMessage,
    required TResult Function(List<PlayerEntity> players, int offset)
        getPlayers,
  }) {
    return getData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getData,
    TResult? Function()? showMessage,
    TResult? Function(List<PlayerEntity> players, int offset)? getPlayers,
  }) {
    return getData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getData,
    TResult Function()? showMessage,
    TResult Function(List<PlayerEntity> players, int offset)? getPlayers,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetData value) getData,
    required TResult Function(ShowMessage value) showMessage,
    required TResult Function(GetPlayers value) getPlayers,
  }) {
    return getData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetData value)? getData,
    TResult? Function(ShowMessage value)? showMessage,
    TResult? Function(GetPlayers value)? getPlayers,
  }) {
    return getData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetData value)? getData,
    TResult Function(ShowMessage value)? showMessage,
    TResult Function(GetPlayers value)? getPlayers,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(this);
    }
    return orElse();
  }
}

abstract class GetData implements ExampleEvent {
  const factory GetData() = _$GetDataImpl;
}

/// @nodoc
abstract class _$$ShowMessageImplCopyWith<$Res> {
  factory _$$ShowMessageImplCopyWith(
          _$ShowMessageImpl value, $Res Function(_$ShowMessageImpl) then) =
      __$$ShowMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowMessageImplCopyWithImpl<$Res>
    extends _$ExampleEventCopyWithImpl<$Res, _$ShowMessageImpl>
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
    return 'ExampleEvent.showMessage()';
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
    required TResult Function() getData,
    required TResult Function() showMessage,
    required TResult Function(List<PlayerEntity> players, int offset)
        getPlayers,
  }) {
    return showMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getData,
    TResult? Function()? showMessage,
    TResult? Function(List<PlayerEntity> players, int offset)? getPlayers,
  }) {
    return showMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getData,
    TResult Function()? showMessage,
    TResult Function(List<PlayerEntity> players, int offset)? getPlayers,
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
    required TResult Function(GetData value) getData,
    required TResult Function(ShowMessage value) showMessage,
    required TResult Function(GetPlayers value) getPlayers,
  }) {
    return showMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetData value)? getData,
    TResult? Function(ShowMessage value)? showMessage,
    TResult? Function(GetPlayers value)? getPlayers,
  }) {
    return showMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetData value)? getData,
    TResult Function(ShowMessage value)? showMessage,
    TResult Function(GetPlayers value)? getPlayers,
    required TResult orElse(),
  }) {
    if (showMessage != null) {
      return showMessage(this);
    }
    return orElse();
  }
}

abstract class ShowMessage implements ExampleEvent {
  const factory ShowMessage() = _$ShowMessageImpl;
}

/// @nodoc
abstract class _$$GetPlayersImplCopyWith<$Res> {
  factory _$$GetPlayersImplCopyWith(
          _$GetPlayersImpl value, $Res Function(_$GetPlayersImpl) then) =
      __$$GetPlayersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PlayerEntity> players, int offset});
}

/// @nodoc
class __$$GetPlayersImplCopyWithImpl<$Res>
    extends _$ExampleEventCopyWithImpl<$Res, _$GetPlayersImpl>
    implements _$$GetPlayersImplCopyWith<$Res> {
  __$$GetPlayersImplCopyWithImpl(
      _$GetPlayersImpl _value, $Res Function(_$GetPlayersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
    Object? offset = null,
  }) {
    return _then(_$GetPlayersImpl(
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerEntity>,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetPlayersImpl implements GetPlayers {
  const _$GetPlayersImpl(
      {required final List<PlayerEntity> players, required this.offset})
      : _players = players;

  final List<PlayerEntity> _players;
  @override
  List<PlayerEntity> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final int offset;

  @override
  String toString() {
    return 'ExampleEvent.getPlayers(players: $players, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPlayersImpl &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_players), offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPlayersImplCopyWith<_$GetPlayersImpl> get copyWith =>
      __$$GetPlayersImplCopyWithImpl<_$GetPlayersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getData,
    required TResult Function() showMessage,
    required TResult Function(List<PlayerEntity> players, int offset)
        getPlayers,
  }) {
    return getPlayers(players, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getData,
    TResult? Function()? showMessage,
    TResult? Function(List<PlayerEntity> players, int offset)? getPlayers,
  }) {
    return getPlayers?.call(players, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getData,
    TResult Function()? showMessage,
    TResult Function(List<PlayerEntity> players, int offset)? getPlayers,
    required TResult orElse(),
  }) {
    if (getPlayers != null) {
      return getPlayers(players, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetData value) getData,
    required TResult Function(ShowMessage value) showMessage,
    required TResult Function(GetPlayers value) getPlayers,
  }) {
    return getPlayers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetData value)? getData,
    TResult? Function(ShowMessage value)? showMessage,
    TResult? Function(GetPlayers value)? getPlayers,
  }) {
    return getPlayers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetData value)? getData,
    TResult Function(ShowMessage value)? showMessage,
    TResult Function(GetPlayers value)? getPlayers,
    required TResult orElse(),
  }) {
    if (getPlayers != null) {
      return getPlayers(this);
    }
    return orElse();
  }
}

abstract class GetPlayers implements ExampleEvent {
  const factory GetPlayers(
      {required final List<PlayerEntity> players,
      required final int offset}) = _$GetPlayersImpl;

  List<PlayerEntity> get players;
  int get offset;
  @JsonKey(ignore: true)
  _$$GetPlayersImplCopyWith<_$GetPlayersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
