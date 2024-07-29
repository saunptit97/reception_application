// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'robot_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RobotInfoModel _$RobotInfoModelFromJson(Map<String, dynamic> json) {
  return _RobotInfoModel.fromJson(json);
}

/// @nodoc
mixin _$RobotInfoModel {
  @JsonKey(name: "robot_id")
  String? get robotId => throw _privateConstructorUsedError;
  @JsonKey(name: "nav_version")
  String? get navVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RobotInfoModelCopyWith<RobotInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RobotInfoModelCopyWith<$Res> {
  factory $RobotInfoModelCopyWith(
          RobotInfoModel value, $Res Function(RobotInfoModel) then) =
      _$RobotInfoModelCopyWithImpl<$Res, RobotInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "robot_id") String? robotId,
      @JsonKey(name: "nav_version") String? navVersion});
}

/// @nodoc
class _$RobotInfoModelCopyWithImpl<$Res, $Val extends RobotInfoModel>
    implements $RobotInfoModelCopyWith<$Res> {
  _$RobotInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? robotId = freezed,
    Object? navVersion = freezed,
  }) {
    return _then(_value.copyWith(
      robotId: freezed == robotId
          ? _value.robotId
          : robotId // ignore: cast_nullable_to_non_nullable
              as String?,
      navVersion: freezed == navVersion
          ? _value.navVersion
          : navVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RobotInfoModelImplCopyWith<$Res>
    implements $RobotInfoModelCopyWith<$Res> {
  factory _$$RobotInfoModelImplCopyWith(_$RobotInfoModelImpl value,
          $Res Function(_$RobotInfoModelImpl) then) =
      __$$RobotInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "robot_id") String? robotId,
      @JsonKey(name: "nav_version") String? navVersion});
}

/// @nodoc
class __$$RobotInfoModelImplCopyWithImpl<$Res>
    extends _$RobotInfoModelCopyWithImpl<$Res, _$RobotInfoModelImpl>
    implements _$$RobotInfoModelImplCopyWith<$Res> {
  __$$RobotInfoModelImplCopyWithImpl(
      _$RobotInfoModelImpl _value, $Res Function(_$RobotInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? robotId = freezed,
    Object? navVersion = freezed,
  }) {
    return _then(_$RobotInfoModelImpl(
      robotId: freezed == robotId
          ? _value.robotId
          : robotId // ignore: cast_nullable_to_non_nullable
              as String?,
      navVersion: freezed == navVersion
          ? _value.navVersion
          : navVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RobotInfoModelImpl implements _RobotInfoModel {
  const _$RobotInfoModelImpl(
      {@JsonKey(name: "robot_id") this.robotId,
      @JsonKey(name: "nav_version") this.navVersion});

  factory _$RobotInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RobotInfoModelImplFromJson(json);

  @override
  @JsonKey(name: "robot_id")
  final String? robotId;
  @override
  @JsonKey(name: "nav_version")
  final String? navVersion;

  @override
  String toString() {
    return 'RobotInfoModel(robotId: $robotId, navVersion: $navVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RobotInfoModelImpl &&
            (identical(other.robotId, robotId) || other.robotId == robotId) &&
            (identical(other.navVersion, navVersion) ||
                other.navVersion == navVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, robotId, navVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RobotInfoModelImplCopyWith<_$RobotInfoModelImpl> get copyWith =>
      __$$RobotInfoModelImplCopyWithImpl<_$RobotInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RobotInfoModelImplToJson(
      this,
    );
  }
}

abstract class _RobotInfoModel implements RobotInfoModel {
  const factory _RobotInfoModel(
          {@JsonKey(name: "robot_id") final String? robotId,
          @JsonKey(name: "nav_version") final String? navVersion}) =
      _$RobotInfoModelImpl;

  factory _RobotInfoModel.fromJson(Map<String, dynamic> json) =
      _$RobotInfoModelImpl.fromJson;

  @override
  @JsonKey(name: "robot_id")
  String? get robotId;
  @override
  @JsonKey(name: "nav_version")
  String? get navVersion;
  @override
  @JsonKey(ignore: true)
  _$$RobotInfoModelImplCopyWith<_$RobotInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
