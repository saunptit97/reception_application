// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WifiModel _$WifiModelFromJson(Map<String, dynamic> json) {
  return _WifiModel.fromJson(json);
}

/// @nodoc
mixin _$WifiModel {
  String? get ip => throw _privateConstructorUsedError;
  @JsonKey(name: 'wifi_name')
  String? get wifiName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WifiModelCopyWith<WifiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WifiModelCopyWith<$Res> {
  factory $WifiModelCopyWith(WifiModel value, $Res Function(WifiModel) then) =
      _$WifiModelCopyWithImpl<$Res, WifiModel>;
  @useResult
  $Res call({String? ip, @JsonKey(name: 'wifi_name') String? wifiName});
}

/// @nodoc
class _$WifiModelCopyWithImpl<$Res, $Val extends WifiModel>
    implements $WifiModelCopyWith<$Res> {
  _$WifiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = freezed,
    Object? wifiName = freezed,
  }) {
    return _then(_value.copyWith(
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      wifiName: freezed == wifiName
          ? _value.wifiName
          : wifiName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WifiModelImplCopyWith<$Res>
    implements $WifiModelCopyWith<$Res> {
  factory _$$WifiModelImplCopyWith(
          _$WifiModelImpl value, $Res Function(_$WifiModelImpl) then) =
      __$$WifiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? ip, @JsonKey(name: 'wifi_name') String? wifiName});
}

/// @nodoc
class __$$WifiModelImplCopyWithImpl<$Res>
    extends _$WifiModelCopyWithImpl<$Res, _$WifiModelImpl>
    implements _$$WifiModelImplCopyWith<$Res> {
  __$$WifiModelImplCopyWithImpl(
      _$WifiModelImpl _value, $Res Function(_$WifiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = freezed,
    Object? wifiName = freezed,
  }) {
    return _then(_$WifiModelImpl(
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      wifiName: freezed == wifiName
          ? _value.wifiName
          : wifiName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WifiModelImpl implements _WifiModel {
  const _$WifiModelImpl({this.ip, @JsonKey(name: 'wifi_name') this.wifiName});

  factory _$WifiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WifiModelImplFromJson(json);

  @override
  final String? ip;
  @override
  @JsonKey(name: 'wifi_name')
  final String? wifiName;

  @override
  String toString() {
    return 'WifiModel(ip: $ip, wifiName: $wifiName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WifiModelImpl &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.wifiName, wifiName) ||
                other.wifiName == wifiName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ip, wifiName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WifiModelImplCopyWith<_$WifiModelImpl> get copyWith =>
      __$$WifiModelImplCopyWithImpl<_$WifiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WifiModelImplToJson(
      this,
    );
  }
}

abstract class _WifiModel implements WifiModel {
  const factory _WifiModel(
      {final String? ip,
      @JsonKey(name: 'wifi_name') final String? wifiName}) = _$WifiModelImpl;

  factory _WifiModel.fromJson(Map<String, dynamic> json) =
      _$WifiModelImpl.fromJson;

  @override
  String? get ip;
  @override
  @JsonKey(name: 'wifi_name')
  String? get wifiName;
  @override
  @JsonKey(ignore: true)
  _$$WifiModelImplCopyWith<_$WifiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
