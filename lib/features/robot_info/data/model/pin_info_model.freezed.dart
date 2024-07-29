// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PinInfoModel _$PinInfoModelFromJson(Map<String, dynamic> json) {
  return _PinInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PinInfoModel {
  @JsonKey(name: "pin_level")
  int? get pinLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "pin_status")
  String? get pinStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "charging")
  bool? get charging => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PinInfoModelCopyWith<PinInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinInfoModelCopyWith<$Res> {
  factory $PinInfoModelCopyWith(
          PinInfoModel value, $Res Function(PinInfoModel) then) =
      _$PinInfoModelCopyWithImpl<$Res, PinInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "pin_level") int? pinLevel,
      @JsonKey(name: "pin_status") String? pinStatus,
      @JsonKey(name: "charging") bool? charging});
}

/// @nodoc
class _$PinInfoModelCopyWithImpl<$Res, $Val extends PinInfoModel>
    implements $PinInfoModelCopyWith<$Res> {
  _$PinInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinLevel = freezed,
    Object? pinStatus = freezed,
    Object? charging = freezed,
  }) {
    return _then(_value.copyWith(
      pinLevel: freezed == pinLevel
          ? _value.pinLevel
          : pinLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      pinStatus: freezed == pinStatus
          ? _value.pinStatus
          : pinStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      charging: freezed == charging
          ? _value.charging
          : charging // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PinInfoModelImplCopyWith<$Res>
    implements $PinInfoModelCopyWith<$Res> {
  factory _$$PinInfoModelImplCopyWith(
          _$PinInfoModelImpl value, $Res Function(_$PinInfoModelImpl) then) =
      __$$PinInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "pin_level") int? pinLevel,
      @JsonKey(name: "pin_status") String? pinStatus,
      @JsonKey(name: "charging") bool? charging});
}

/// @nodoc
class __$$PinInfoModelImplCopyWithImpl<$Res>
    extends _$PinInfoModelCopyWithImpl<$Res, _$PinInfoModelImpl>
    implements _$$PinInfoModelImplCopyWith<$Res> {
  __$$PinInfoModelImplCopyWithImpl(
      _$PinInfoModelImpl _value, $Res Function(_$PinInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinLevel = freezed,
    Object? pinStatus = freezed,
    Object? charging = freezed,
  }) {
    return _then(_$PinInfoModelImpl(
      pinLevel: freezed == pinLevel
          ? _value.pinLevel
          : pinLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      pinStatus: freezed == pinStatus
          ? _value.pinStatus
          : pinStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      charging: freezed == charging
          ? _value.charging
          : charging // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PinInfoModelImpl implements _PinInfoModel {
  const _$PinInfoModelImpl(
      {@JsonKey(name: "pin_level") this.pinLevel,
      @JsonKey(name: "pin_status") this.pinStatus,
      @JsonKey(name: "charging") this.charging});

  factory _$PinInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PinInfoModelImplFromJson(json);

  @override
  @JsonKey(name: "pin_level")
  final int? pinLevel;
  @override
  @JsonKey(name: "pin_status")
  final String? pinStatus;
  @override
  @JsonKey(name: "charging")
  final bool? charging;

  @override
  String toString() {
    return 'PinInfoModel(pinLevel: $pinLevel, pinStatus: $pinStatus, charging: $charging)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinInfoModelImpl &&
            (identical(other.pinLevel, pinLevel) ||
                other.pinLevel == pinLevel) &&
            (identical(other.pinStatus, pinStatus) ||
                other.pinStatus == pinStatus) &&
            (identical(other.charging, charging) ||
                other.charging == charging));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pinLevel, pinStatus, charging);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PinInfoModelImplCopyWith<_$PinInfoModelImpl> get copyWith =>
      __$$PinInfoModelImplCopyWithImpl<_$PinInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PinInfoModelImplToJson(
      this,
    );
  }
}

abstract class _PinInfoModel implements PinInfoModel {
  const factory _PinInfoModel(
      {@JsonKey(name: "pin_level") final int? pinLevel,
      @JsonKey(name: "pin_status") final String? pinStatus,
      @JsonKey(name: "charging") final bool? charging}) = _$PinInfoModelImpl;

  factory _PinInfoModel.fromJson(Map<String, dynamic> json) =
      _$PinInfoModelImpl.fromJson;

  @override
  @JsonKey(name: "pin_level")
  int? get pinLevel;
  @override
  @JsonKey(name: "pin_status")
  String? get pinStatus;
  @override
  @JsonKey(name: "charging")
  bool? get charging;
  @override
  @JsonKey(ignore: true)
  _$$PinInfoModelImplCopyWith<_$PinInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
