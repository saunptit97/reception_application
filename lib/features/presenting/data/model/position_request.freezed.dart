// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PositionRequest _$PositionRequestFromJson(Map<String, dynamic> json) {
  return _PositionRequest.fromJson(json);
}

/// @nodoc
mixin _$PositionRequest {
  double? get x => throw _privateConstructorUsedError;
  double? get y => throw _privateConstructorUsedError;
  double? get angle => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionRequestCopyWith<PositionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionRequestCopyWith<$Res> {
  factory $PositionRequestCopyWith(
          PositionRequest value, $Res Function(PositionRequest) then) =
      _$PositionRequestCopyWithImpl<$Res, PositionRequest>;
  @useResult
  $Res call(
      {double? x,
      double? y,
      double? angle,
      String? name,
      String? id,
      int? type});
}

/// @nodoc
class _$PositionRequestCopyWithImpl<$Res, $Val extends PositionRequest>
    implements $PositionRequestCopyWith<$Res> {
  _$PositionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? angle = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
      angle: freezed == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionRequestImplCopyWith<$Res>
    implements $PositionRequestCopyWith<$Res> {
  factory _$$PositionRequestImplCopyWith(_$PositionRequestImpl value,
          $Res Function(_$PositionRequestImpl) then) =
      __$$PositionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? x,
      double? y,
      double? angle,
      String? name,
      String? id,
      int? type});
}

/// @nodoc
class __$$PositionRequestImplCopyWithImpl<$Res>
    extends _$PositionRequestCopyWithImpl<$Res, _$PositionRequestImpl>
    implements _$$PositionRequestImplCopyWith<$Res> {
  __$$PositionRequestImplCopyWithImpl(
      _$PositionRequestImpl _value, $Res Function(_$PositionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? angle = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_$PositionRequestImpl(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
      angle: freezed == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionRequestImpl implements _PositionRequest {
  const _$PositionRequestImpl(
      {this.x, this.y, this.angle, this.name, this.id, this.type});

  factory _$PositionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionRequestImplFromJson(json);

  @override
  final double? x;
  @override
  final double? y;
  @override
  final double? angle;
  @override
  final String? name;
  @override
  final String? id;
  @override
  final int? type;

  @override
  String toString() {
    return 'PositionRequest(x: $x, y: $y, angle: $angle, name: $name, id: $id, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionRequestImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.angle, angle) || other.angle == angle) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, angle, name, id, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionRequestImplCopyWith<_$PositionRequestImpl> get copyWith =>
      __$$PositionRequestImplCopyWithImpl<_$PositionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionRequestImplToJson(
      this,
    );
  }
}

abstract class _PositionRequest implements PositionRequest {
  const factory _PositionRequest(
      {final double? x,
      final double? y,
      final double? angle,
      final String? name,
      final String? id,
      final int? type}) = _$PositionRequestImpl;

  factory _PositionRequest.fromJson(Map<String, dynamic> json) =
      _$PositionRequestImpl.fromJson;

  @override
  double? get x;
  @override
  double? get y;
  @override
  double? get angle;
  @override
  String? get name;
  @override
  String? get id;
  @override
  int? get type;
  @override
  @JsonKey(ignore: true)
  _$$PositionRequestImplCopyWith<_$PositionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
