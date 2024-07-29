// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SensorInfoModel _$SensorInfoModelFromJson(Map<String, dynamic> json) {
  return _SensorInfoModel.fromJson(json);
}

/// @nodoc
mixin _$SensorInfoModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  SensorInfoStatus? get status => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SensorInfoModelCopyWith<SensorInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorInfoModelCopyWith<$Res> {
  factory $SensorInfoModelCopyWith(
          SensorInfoModel value, $Res Function(SensorInfoModel) then) =
      _$SensorInfoModelCopyWithImpl<$Res, SensorInfoModel>;
  @useResult
  $Res call(
      {String? id, String? name, SensorInfoStatus? status, double? value});
}

/// @nodoc
class _$SensorInfoModelCopyWithImpl<$Res, $Val extends SensorInfoModel>
    implements $SensorInfoModelCopyWith<$Res> {
  _$SensorInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SensorInfoStatus?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SensorInfoModelImplCopyWith<$Res>
    implements $SensorInfoModelCopyWith<$Res> {
  factory _$$SensorInfoModelImplCopyWith(_$SensorInfoModelImpl value,
          $Res Function(_$SensorInfoModelImpl) then) =
      __$$SensorInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String? name, SensorInfoStatus? status, double? value});
}

/// @nodoc
class __$$SensorInfoModelImplCopyWithImpl<$Res>
    extends _$SensorInfoModelCopyWithImpl<$Res, _$SensorInfoModelImpl>
    implements _$$SensorInfoModelImplCopyWith<$Res> {
  __$$SensorInfoModelImplCopyWithImpl(
      _$SensorInfoModelImpl _value, $Res Function(_$SensorInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? value = freezed,
  }) {
    return _then(_$SensorInfoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SensorInfoStatus?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SensorInfoModelImpl implements _SensorInfoModel {
  const _$SensorInfoModelImpl({this.id, this.name, this.status, this.value});

  factory _$SensorInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SensorInfoModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final SensorInfoStatus? status;
  @override
  final double? value;

  @override
  String toString() {
    return 'SensorInfoModel(id: $id, name: $name, status: $status, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorInfoModelImplCopyWith<_$SensorInfoModelImpl> get copyWith =>
      __$$SensorInfoModelImplCopyWithImpl<_$SensorInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SensorInfoModelImplToJson(
      this,
    );
  }
}

abstract class _SensorInfoModel implements SensorInfoModel {
  const factory _SensorInfoModel(
      {final String? id,
      final String? name,
      final SensorInfoStatus? status,
      final double? value}) = _$SensorInfoModelImpl;

  factory _SensorInfoModel.fromJson(Map<String, dynamic> json) =
      _$SensorInfoModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  SensorInfoStatus? get status;
  @override
  double? get value;
  @override
  @JsonKey(ignore: true)
  _$$SensorInfoModelImplCopyWith<_$SensorInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
