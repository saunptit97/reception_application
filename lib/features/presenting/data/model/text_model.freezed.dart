// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextModel _$TextModelFromJson(Map<String, dynamic> json) {
  return _TextModel.fromJson(json);
}

/// @nodoc
mixin _$TextModel {
  @JsonKey(name: "full_text")
  String? get fullText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextModelCopyWith<TextModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextModelCopyWith<$Res> {
  factory $TextModelCopyWith(TextModel value, $Res Function(TextModel) then) =
      _$TextModelCopyWithImpl<$Res, TextModel>;
  @useResult
  $Res call({@JsonKey(name: "full_text") String? fullText});
}

/// @nodoc
class _$TextModelCopyWithImpl<$Res, $Val extends TextModel>
    implements $TextModelCopyWith<$Res> {
  _$TextModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullText = freezed,
  }) {
    return _then(_value.copyWith(
      fullText: freezed == fullText
          ? _value.fullText
          : fullText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextModelImplCopyWith<$Res>
    implements $TextModelCopyWith<$Res> {
  factory _$$TextModelImplCopyWith(
          _$TextModelImpl value, $Res Function(_$TextModelImpl) then) =
      __$$TextModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "full_text") String? fullText});
}

/// @nodoc
class __$$TextModelImplCopyWithImpl<$Res>
    extends _$TextModelCopyWithImpl<$Res, _$TextModelImpl>
    implements _$$TextModelImplCopyWith<$Res> {
  __$$TextModelImplCopyWithImpl(
      _$TextModelImpl _value, $Res Function(_$TextModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullText = freezed,
  }) {
    return _then(_$TextModelImpl(
      fullText: freezed == fullText
          ? _value.fullText
          : fullText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextModelImpl implements _TextModel {
  const _$TextModelImpl({@JsonKey(name: "full_text") this.fullText});

  factory _$TextModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextModelImplFromJson(json);

  @override
  @JsonKey(name: "full_text")
  final String? fullText;

  @override
  String toString() {
    return 'TextModel(fullText: $fullText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextModelImpl &&
            (identical(other.fullText, fullText) ||
                other.fullText == fullText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextModelImplCopyWith<_$TextModelImpl> get copyWith =>
      __$$TextModelImplCopyWithImpl<_$TextModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextModelImplToJson(
      this,
    );
  }
}

abstract class _TextModel implements TextModel {
  const factory _TextModel(
      {@JsonKey(name: "full_text") final String? fullText}) = _$TextModelImpl;

  factory _TextModel.fromJson(Map<String, dynamic> json) =
      _$TextModelImpl.fromJson;

  @override
  @JsonKey(name: "full_text")
  String? get fullText;
  @override
  @JsonKey(ignore: true)
  _$$TextModelImplCopyWith<_$TextModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioModel _$AudioModelFromJson(Map<String, dynamic> json) {
  return _AudioModel.fromJson(json);
}

/// @nodoc
mixin _$AudioModel {
  @JsonKey(name: "audio")
  List<int>? get audio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioModelCopyWith<AudioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioModelCopyWith<$Res> {
  factory $AudioModelCopyWith(
          AudioModel value, $Res Function(AudioModel) then) =
      _$AudioModelCopyWithImpl<$Res, AudioModel>;
  @useResult
  $Res call({@JsonKey(name: "audio") List<int>? audio});
}

/// @nodoc
class _$AudioModelCopyWithImpl<$Res, $Val extends AudioModel>
    implements $AudioModelCopyWith<$Res> {
  _$AudioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = freezed,
  }) {
    return _then(_value.copyWith(
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioModelImplCopyWith<$Res>
    implements $AudioModelCopyWith<$Res> {
  factory _$$AudioModelImplCopyWith(
          _$AudioModelImpl value, $Res Function(_$AudioModelImpl) then) =
      __$$AudioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "audio") List<int>? audio});
}

/// @nodoc
class __$$AudioModelImplCopyWithImpl<$Res>
    extends _$AudioModelCopyWithImpl<$Res, _$AudioModelImpl>
    implements _$$AudioModelImplCopyWith<$Res> {
  __$$AudioModelImplCopyWithImpl(
      _$AudioModelImpl _value, $Res Function(_$AudioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = freezed,
  }) {
    return _then(_$AudioModelImpl(
      audio: freezed == audio
          ? _value._audio
          : audio // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioModelImpl implements _AudioModel {
  const _$AudioModelImpl({@JsonKey(name: "audio") final List<int>? audio})
      : _audio = audio;

  factory _$AudioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioModelImplFromJson(json);

  final List<int>? _audio;
  @override
  @JsonKey(name: "audio")
  List<int>? get audio {
    final value = _audio;
    if (value == null) return null;
    if (_audio is EqualUnmodifiableListView) return _audio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AudioModel(audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioModelImpl &&
            const DeepCollectionEquality().equals(other._audio, _audio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_audio));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioModelImplCopyWith<_$AudioModelImpl> get copyWith =>
      __$$AudioModelImplCopyWithImpl<_$AudioModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioModelImplToJson(
      this,
    );
  }
}

abstract class _AudioModel implements AudioModel {
  const factory _AudioModel({@JsonKey(name: "audio") final List<int>? audio}) =
      _$AudioModelImpl;

  factory _AudioModel.fromJson(Map<String, dynamic> json) =
      _$AudioModelImpl.fromJson;

  @override
  @JsonKey(name: "audio")
  List<int>? get audio;
  @override
  @JsonKey(ignore: true)
  _$$AudioModelImplCopyWith<_$AudioModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RobotModel _$RobotModelFromJson(Map<String, dynamic> json) {
  return _RobotModel.fromJson(json);
}

/// @nodoc
mixin _$RobotModel {
  @JsonKey(name: "session_id")
  String? get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: "robot_id")
  String? get robotId => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  ChatBotModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RobotModelCopyWith<RobotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RobotModelCopyWith<$Res> {
  factory $RobotModelCopyWith(
          RobotModel value, $Res Function(RobotModel) then) =
      _$RobotModelCopyWithImpl<$Res, RobotModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "session_id") String? sessionId,
      @JsonKey(name: "robot_id") String? robotId,
      @JsonKey(name: "data") ChatBotModel? data});

  $ChatBotModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$RobotModelCopyWithImpl<$Res, $Val extends RobotModel>
    implements $RobotModelCopyWith<$Res> {
  _$RobotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? robotId = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      robotId: freezed == robotId
          ? _value.robotId
          : robotId // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChatBotModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatBotModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ChatBotModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RobotModelImplCopyWith<$Res>
    implements $RobotModelCopyWith<$Res> {
  factory _$$RobotModelImplCopyWith(
          _$RobotModelImpl value, $Res Function(_$RobotModelImpl) then) =
      __$$RobotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "session_id") String? sessionId,
      @JsonKey(name: "robot_id") String? robotId,
      @JsonKey(name: "data") ChatBotModel? data});

  @override
  $ChatBotModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$RobotModelImplCopyWithImpl<$Res>
    extends _$RobotModelCopyWithImpl<$Res, _$RobotModelImpl>
    implements _$$RobotModelImplCopyWith<$Res> {
  __$$RobotModelImplCopyWithImpl(
      _$RobotModelImpl _value, $Res Function(_$RobotModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? robotId = freezed,
    Object? data = freezed,
  }) {
    return _then(_$RobotModelImpl(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      robotId: freezed == robotId
          ? _value.robotId
          : robotId // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChatBotModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RobotModelImpl implements _RobotModel {
  const _$RobotModelImpl(
      {@JsonKey(name: "session_id") this.sessionId,
      @JsonKey(name: "robot_id") this.robotId,
      @JsonKey(name: "data") this.data});

  factory _$RobotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RobotModelImplFromJson(json);

  @override
  @JsonKey(name: "session_id")
  final String? sessionId;
  @override
  @JsonKey(name: "robot_id")
  final String? robotId;
  @override
  @JsonKey(name: "data")
  final ChatBotModel? data;

  @override
  String toString() {
    return 'RobotModel(sessionId: $sessionId, robotId: $robotId, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RobotModelImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.robotId, robotId) || other.robotId == robotId) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, robotId, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RobotModelImplCopyWith<_$RobotModelImpl> get copyWith =>
      __$$RobotModelImplCopyWithImpl<_$RobotModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RobotModelImplToJson(
      this,
    );
  }
}

abstract class _RobotModel implements RobotModel {
  const factory _RobotModel(
      {@JsonKey(name: "session_id") final String? sessionId,
      @JsonKey(name: "robot_id") final String? robotId,
      @JsonKey(name: "data") final ChatBotModel? data}) = _$RobotModelImpl;

  factory _RobotModel.fromJson(Map<String, dynamic> json) =
      _$RobotModelImpl.fromJson;

  @override
  @JsonKey(name: "session_id")
  String? get sessionId;
  @override
  @JsonKey(name: "robot_id")
  String? get robotId;
  @override
  @JsonKey(name: "data")
  ChatBotModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$RobotModelImplCopyWith<_$RobotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatBotModel _$ChatBotModelFromJson(Map<String, dynamic> json) {
  return _ChatBotModel.fromJson(json);
}

/// @nodoc
mixin _$ChatBotModel {
  @JsonKey(name: "intent")
  String? get intent => throw _privateConstructorUsedError;
  @JsonKey(name: "text")
  String? get response => throw _privateConstructorUsedError;
  @JsonKey(name: "index")
  int? get index => throw _privateConstructorUsedError;
  @JsonKey(name: "entity")
  dynamic get entity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatBotModelCopyWith<ChatBotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBotModelCopyWith<$Res> {
  factory $ChatBotModelCopyWith(
          ChatBotModel value, $Res Function(ChatBotModel) then) =
      _$ChatBotModelCopyWithImpl<$Res, ChatBotModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "intent") String? intent,
      @JsonKey(name: "text") String? response,
      @JsonKey(name: "index") int? index,
      @JsonKey(name: "entity") dynamic entity});
}

/// @nodoc
class _$ChatBotModelCopyWithImpl<$Res, $Val extends ChatBotModel>
    implements $ChatBotModelCopyWith<$Res> {
  _$ChatBotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intent = freezed,
    Object? response = freezed,
    Object? index = freezed,
    Object? entity = freezed,
  }) {
    return _then(_value.copyWith(
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatBotModelImplCopyWith<$Res>
    implements $ChatBotModelCopyWith<$Res> {
  factory _$$ChatBotModelImplCopyWith(
          _$ChatBotModelImpl value, $Res Function(_$ChatBotModelImpl) then) =
      __$$ChatBotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "intent") String? intent,
      @JsonKey(name: "text") String? response,
      @JsonKey(name: "index") int? index,
      @JsonKey(name: "entity") dynamic entity});
}

/// @nodoc
class __$$ChatBotModelImplCopyWithImpl<$Res>
    extends _$ChatBotModelCopyWithImpl<$Res, _$ChatBotModelImpl>
    implements _$$ChatBotModelImplCopyWith<$Res> {
  __$$ChatBotModelImplCopyWithImpl(
      _$ChatBotModelImpl _value, $Res Function(_$ChatBotModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intent = freezed,
    Object? response = freezed,
    Object? index = freezed,
    Object? entity = freezed,
  }) {
    return _then(_$ChatBotModelImpl(
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatBotModelImpl implements _ChatBotModel {
  const _$ChatBotModelImpl(
      {@JsonKey(name: "intent") this.intent,
      @JsonKey(name: "text") this.response,
      @JsonKey(name: "index") this.index,
      @JsonKey(name: "entity") this.entity});

  factory _$ChatBotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatBotModelImplFromJson(json);

  @override
  @JsonKey(name: "intent")
  final String? intent;
  @override
  @JsonKey(name: "text")
  final String? response;
  @override
  @JsonKey(name: "index")
  final int? index;
  @override
  @JsonKey(name: "entity")
  final dynamic entity;

  @override
  String toString() {
    return 'ChatBotModel(intent: $intent, response: $response, index: $index, entity: $entity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatBotModelImpl &&
            (identical(other.intent, intent) || other.intent == intent) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, intent, response, index,
      const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatBotModelImplCopyWith<_$ChatBotModelImpl> get copyWith =>
      __$$ChatBotModelImplCopyWithImpl<_$ChatBotModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatBotModelImplToJson(
      this,
    );
  }
}

abstract class _ChatBotModel implements ChatBotModel {
  const factory _ChatBotModel(
      {@JsonKey(name: "intent") final String? intent,
      @JsonKey(name: "text") final String? response,
      @JsonKey(name: "index") final int? index,
      @JsonKey(name: "entity") final dynamic entity}) = _$ChatBotModelImpl;

  factory _ChatBotModel.fromJson(Map<String, dynamic> json) =
      _$ChatBotModelImpl.fromJson;

  @override
  @JsonKey(name: "intent")
  String? get intent;
  @override
  @JsonKey(name: "text")
  String? get response;
  @override
  @JsonKey(name: "index")
  int? get index;
  @override
  @JsonKey(name: "entity")
  dynamic get entity;
  @override
  @JsonKey(ignore: true)
  _$$ChatBotModelImplCopyWith<_$ChatBotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
