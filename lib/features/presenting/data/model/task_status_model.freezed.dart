// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskStatusModel _$TaskStatusModelFromJson(Map<String, dynamic> json) {
  return _TaskStatusModel.fromJson(json);
}

/// @nodoc
mixin _$TaskStatusModel {
  TaskStatus? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskStatusModelCopyWith<TaskStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStatusModelCopyWith<$Res> {
  factory $TaskStatusModelCopyWith(
          TaskStatusModel value, $Res Function(TaskStatusModel) then) =
      _$TaskStatusModelCopyWithImpl<$Res, TaskStatusModel>;
  @useResult
  $Res call({TaskStatus? status, String? message});
}

/// @nodoc
class _$TaskStatusModelCopyWithImpl<$Res, $Val extends TaskStatusModel>
    implements $TaskStatusModelCopyWith<$Res> {
  _$TaskStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskStatusModelImplCopyWith<$Res>
    implements $TaskStatusModelCopyWith<$Res> {
  factory _$$TaskStatusModelImplCopyWith(_$TaskStatusModelImpl value,
          $Res Function(_$TaskStatusModelImpl) then) =
      __$$TaskStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TaskStatus? status, String? message});
}

/// @nodoc
class __$$TaskStatusModelImplCopyWithImpl<$Res>
    extends _$TaskStatusModelCopyWithImpl<$Res, _$TaskStatusModelImpl>
    implements _$$TaskStatusModelImplCopyWith<$Res> {
  __$$TaskStatusModelImplCopyWithImpl(
      _$TaskStatusModelImpl _value, $Res Function(_$TaskStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$TaskStatusModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskStatusModelImpl implements _TaskStatusModel {
  const _$TaskStatusModelImpl({this.status, this.message});

  factory _$TaskStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskStatusModelImplFromJson(json);

  @override
  final TaskStatus? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'TaskStatusModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStatusModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStatusModelImplCopyWith<_$TaskStatusModelImpl> get copyWith =>
      __$$TaskStatusModelImplCopyWithImpl<_$TaskStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskStatusModelImplToJson(
      this,
    );
  }
}

abstract class _TaskStatusModel implements TaskStatusModel {
  const factory _TaskStatusModel(
      {final TaskStatus? status,
      final String? message}) = _$TaskStatusModelImpl;

  factory _TaskStatusModel.fromJson(Map<String, dynamic> json) =
      _$TaskStatusModelImpl.fromJson;

  @override
  TaskStatus? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$TaskStatusModelImplCopyWith<_$TaskStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
