// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorBody) httpInternalServerError,
    required TResult Function() httpUnAuthorizedError,
    required TResult Function(String message) httpUnknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errorBody)? httpInternalServerError,
    TResult? Function()? httpUnAuthorizedError,
    TResult? Function(String message)? httpUnknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorBody)? httpInternalServerError,
    TResult Function()? httpUnAuthorizedError,
    TResult Function(String message)? httpUnknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpInternalServerError value)
        httpInternalServerError,
    required TResult Function(HttpUnAuthorizedError value)
        httpUnAuthorizedError,
    required TResult Function(HttpUnknownError value) httpUnknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpInternalServerError value)? httpInternalServerError,
    TResult? Function(HttpUnAuthorizedError value)? httpUnAuthorizedError,
    TResult? Function(HttpUnknownError value)? httpUnknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpInternalServerError value)? httpInternalServerError,
    TResult Function(HttpUnAuthorizedError value)? httpUnAuthorizedError,
    TResult Function(HttpUnknownError value)? httpUnknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseErrorCopyWith<$Res> {
  factory $BaseErrorCopyWith(BaseError value, $Res Function(BaseError) then) =
      _$BaseErrorCopyWithImpl<$Res, BaseError>;
}

/// @nodoc
class _$BaseErrorCopyWithImpl<$Res, $Val extends BaseError>
    implements $BaseErrorCopyWith<$Res> {
  _$BaseErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HttpInternalServerErrorImplCopyWith<$Res> {
  factory _$$HttpInternalServerErrorImplCopyWith(
          _$HttpInternalServerErrorImpl value,
          $Res Function(_$HttpInternalServerErrorImpl) then) =
      __$$HttpInternalServerErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorBody});
}

/// @nodoc
class __$$HttpInternalServerErrorImplCopyWithImpl<$Res>
    extends _$BaseErrorCopyWithImpl<$Res, _$HttpInternalServerErrorImpl>
    implements _$$HttpInternalServerErrorImplCopyWith<$Res> {
  __$$HttpInternalServerErrorImplCopyWithImpl(
      _$HttpInternalServerErrorImpl _value,
      $Res Function(_$HttpInternalServerErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorBody = null,
  }) {
    return _then(_$HttpInternalServerErrorImpl(
      null == errorBody
          ? _value.errorBody
          : errorBody // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HttpInternalServerErrorImpl implements HttpInternalServerError {
  const _$HttpInternalServerErrorImpl(this.errorBody);

  @override
  final String errorBody;

  @override
  String toString() {
    return 'BaseError.httpInternalServerError(errorBody: $errorBody)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpInternalServerErrorImpl &&
            (identical(other.errorBody, errorBody) ||
                other.errorBody == errorBody));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorBody);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpInternalServerErrorImplCopyWith<_$HttpInternalServerErrorImpl>
      get copyWith => __$$HttpInternalServerErrorImplCopyWithImpl<
          _$HttpInternalServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorBody) httpInternalServerError,
    required TResult Function() httpUnAuthorizedError,
    required TResult Function(String message) httpUnknownError,
  }) {
    return httpInternalServerError(errorBody);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errorBody)? httpInternalServerError,
    TResult? Function()? httpUnAuthorizedError,
    TResult? Function(String message)? httpUnknownError,
  }) {
    return httpInternalServerError?.call(errorBody);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorBody)? httpInternalServerError,
    TResult Function()? httpUnAuthorizedError,
    TResult Function(String message)? httpUnknownError,
    required TResult orElse(),
  }) {
    if (httpInternalServerError != null) {
      return httpInternalServerError(errorBody);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpInternalServerError value)
        httpInternalServerError,
    required TResult Function(HttpUnAuthorizedError value)
        httpUnAuthorizedError,
    required TResult Function(HttpUnknownError value) httpUnknownError,
  }) {
    return httpInternalServerError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpInternalServerError value)? httpInternalServerError,
    TResult? Function(HttpUnAuthorizedError value)? httpUnAuthorizedError,
    TResult? Function(HttpUnknownError value)? httpUnknownError,
  }) {
    return httpInternalServerError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpInternalServerError value)? httpInternalServerError,
    TResult Function(HttpUnAuthorizedError value)? httpUnAuthorizedError,
    TResult Function(HttpUnknownError value)? httpUnknownError,
    required TResult orElse(),
  }) {
    if (httpInternalServerError != null) {
      return httpInternalServerError(this);
    }
    return orElse();
  }
}

abstract class HttpInternalServerError implements BaseError {
  const factory HttpInternalServerError(final String errorBody) =
      _$HttpInternalServerErrorImpl;

  String get errorBody;
  @JsonKey(ignore: true)
  _$$HttpInternalServerErrorImplCopyWith<_$HttpInternalServerErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HttpUnAuthorizedErrorImplCopyWith<$Res> {
  factory _$$HttpUnAuthorizedErrorImplCopyWith(
          _$HttpUnAuthorizedErrorImpl value,
          $Res Function(_$HttpUnAuthorizedErrorImpl) then) =
      __$$HttpUnAuthorizedErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HttpUnAuthorizedErrorImplCopyWithImpl<$Res>
    extends _$BaseErrorCopyWithImpl<$Res, _$HttpUnAuthorizedErrorImpl>
    implements _$$HttpUnAuthorizedErrorImplCopyWith<$Res> {
  __$$HttpUnAuthorizedErrorImplCopyWithImpl(_$HttpUnAuthorizedErrorImpl _value,
      $Res Function(_$HttpUnAuthorizedErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HttpUnAuthorizedErrorImpl implements HttpUnAuthorizedError {
  const _$HttpUnAuthorizedErrorImpl();

  @override
  String toString() {
    return 'BaseError.httpUnAuthorizedError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpUnAuthorizedErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorBody) httpInternalServerError,
    required TResult Function() httpUnAuthorizedError,
    required TResult Function(String message) httpUnknownError,
  }) {
    return httpUnAuthorizedError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errorBody)? httpInternalServerError,
    TResult? Function()? httpUnAuthorizedError,
    TResult? Function(String message)? httpUnknownError,
  }) {
    return httpUnAuthorizedError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorBody)? httpInternalServerError,
    TResult Function()? httpUnAuthorizedError,
    TResult Function(String message)? httpUnknownError,
    required TResult orElse(),
  }) {
    if (httpUnAuthorizedError != null) {
      return httpUnAuthorizedError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpInternalServerError value)
        httpInternalServerError,
    required TResult Function(HttpUnAuthorizedError value)
        httpUnAuthorizedError,
    required TResult Function(HttpUnknownError value) httpUnknownError,
  }) {
    return httpUnAuthorizedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpInternalServerError value)? httpInternalServerError,
    TResult? Function(HttpUnAuthorizedError value)? httpUnAuthorizedError,
    TResult? Function(HttpUnknownError value)? httpUnknownError,
  }) {
    return httpUnAuthorizedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpInternalServerError value)? httpInternalServerError,
    TResult Function(HttpUnAuthorizedError value)? httpUnAuthorizedError,
    TResult Function(HttpUnknownError value)? httpUnknownError,
    required TResult orElse(),
  }) {
    if (httpUnAuthorizedError != null) {
      return httpUnAuthorizedError(this);
    }
    return orElse();
  }
}

abstract class HttpUnAuthorizedError implements BaseError {
  const factory HttpUnAuthorizedError() = _$HttpUnAuthorizedErrorImpl;
}

/// @nodoc
abstract class _$$HttpUnknownErrorImplCopyWith<$Res> {
  factory _$$HttpUnknownErrorImplCopyWith(_$HttpUnknownErrorImpl value,
          $Res Function(_$HttpUnknownErrorImpl) then) =
      __$$HttpUnknownErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HttpUnknownErrorImplCopyWithImpl<$Res>
    extends _$BaseErrorCopyWithImpl<$Res, _$HttpUnknownErrorImpl>
    implements _$$HttpUnknownErrorImplCopyWith<$Res> {
  __$$HttpUnknownErrorImplCopyWithImpl(_$HttpUnknownErrorImpl _value,
      $Res Function(_$HttpUnknownErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$HttpUnknownErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HttpUnknownErrorImpl implements HttpUnknownError {
  const _$HttpUnknownErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'BaseError.httpUnknownError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpUnknownErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpUnknownErrorImplCopyWith<_$HttpUnknownErrorImpl> get copyWith =>
      __$$HttpUnknownErrorImplCopyWithImpl<_$HttpUnknownErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorBody) httpInternalServerError,
    required TResult Function() httpUnAuthorizedError,
    required TResult Function(String message) httpUnknownError,
  }) {
    return httpUnknownError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errorBody)? httpInternalServerError,
    TResult? Function()? httpUnAuthorizedError,
    TResult? Function(String message)? httpUnknownError,
  }) {
    return httpUnknownError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorBody)? httpInternalServerError,
    TResult Function()? httpUnAuthorizedError,
    TResult Function(String message)? httpUnknownError,
    required TResult orElse(),
  }) {
    if (httpUnknownError != null) {
      return httpUnknownError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpInternalServerError value)
        httpInternalServerError,
    required TResult Function(HttpUnAuthorizedError value)
        httpUnAuthorizedError,
    required TResult Function(HttpUnknownError value) httpUnknownError,
  }) {
    return httpUnknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpInternalServerError value)? httpInternalServerError,
    TResult? Function(HttpUnAuthorizedError value)? httpUnAuthorizedError,
    TResult? Function(HttpUnknownError value)? httpUnknownError,
  }) {
    return httpUnknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpInternalServerError value)? httpInternalServerError,
    TResult Function(HttpUnAuthorizedError value)? httpUnAuthorizedError,
    TResult Function(HttpUnknownError value)? httpUnknownError,
    required TResult orElse(),
  }) {
    if (httpUnknownError != null) {
      return httpUnknownError(this);
    }
    return orElse();
  }
}

abstract class HttpUnknownError implements BaseError {
  const factory HttpUnknownError(final String message) = _$HttpUnknownErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$HttpUnknownErrorImplCopyWith<_$HttpUnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
