// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_to_speech_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextToSpeechRequest _$TextToSpeechRequestFromJson(Map<String, dynamic> json) {
  return _TextToSpeechRequestl.fromJson(json);
}

/// @nodoc
mixin _$TextToSpeechRequest {
  @JsonKey(name: "text")
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: "language")
  String? get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextToSpeechRequestCopyWith<TextToSpeechRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextToSpeechRequestCopyWith<$Res> {
  factory $TextToSpeechRequestCopyWith(
          TextToSpeechRequest value, $Res Function(TextToSpeechRequest) then) =
      _$TextToSpeechRequestCopyWithImpl<$Res, TextToSpeechRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "text") String? text,
      @JsonKey(name: "language") String? language});
}

/// @nodoc
class _$TextToSpeechRequestCopyWithImpl<$Res, $Val extends TextToSpeechRequest>
    implements $TextToSpeechRequestCopyWith<$Res> {
  _$TextToSpeechRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextToSpeechRequestlImplCopyWith<$Res>
    implements $TextToSpeechRequestCopyWith<$Res> {
  factory _$$TextToSpeechRequestlImplCopyWith(_$TextToSpeechRequestlImpl value,
          $Res Function(_$TextToSpeechRequestlImpl) then) =
      __$$TextToSpeechRequestlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "text") String? text,
      @JsonKey(name: "language") String? language});
}

/// @nodoc
class __$$TextToSpeechRequestlImplCopyWithImpl<$Res>
    extends _$TextToSpeechRequestCopyWithImpl<$Res, _$TextToSpeechRequestlImpl>
    implements _$$TextToSpeechRequestlImplCopyWith<$Res> {
  __$$TextToSpeechRequestlImplCopyWithImpl(_$TextToSpeechRequestlImpl _value,
      $Res Function(_$TextToSpeechRequestlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? language = freezed,
  }) {
    return _then(_$TextToSpeechRequestlImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextToSpeechRequestlImpl implements _TextToSpeechRequestl {
  const _$TextToSpeechRequestlImpl(
      {@JsonKey(name: "text") this.text,
      @JsonKey(name: "language") this.language});

  factory _$TextToSpeechRequestlImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextToSpeechRequestlImplFromJson(json);

  @override
  @JsonKey(name: "text")
  final String? text;
  @override
  @JsonKey(name: "language")
  final String? language;

  @override
  String toString() {
    return 'TextToSpeechRequest(text: $text, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextToSpeechRequestlImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextToSpeechRequestlImplCopyWith<_$TextToSpeechRequestlImpl>
      get copyWith =>
          __$$TextToSpeechRequestlImplCopyWithImpl<_$TextToSpeechRequestlImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextToSpeechRequestlImplToJson(
      this,
    );
  }
}

abstract class _TextToSpeechRequestl implements TextToSpeechRequest {
  const factory _TextToSpeechRequestl(
          {@JsonKey(name: "text") final String? text,
          @JsonKey(name: "language") final String? language}) =
      _$TextToSpeechRequestlImpl;

  factory _TextToSpeechRequestl.fromJson(Map<String, dynamic> json) =
      _$TextToSpeechRequestlImpl.fromJson;

  @override
  @JsonKey(name: "text")
  String? get text;
  @override
  @JsonKey(name: "language")
  String? get language;
  @override
  @JsonKey(ignore: true)
  _$$TextToSpeechRequestlImplCopyWith<_$TextToSpeechRequestlImpl>
      get copyWith => throw _privateConstructorUsedError;
}
