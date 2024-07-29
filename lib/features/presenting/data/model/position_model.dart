import 'package:freezed_annotation/freezed_annotation.dart';
part 'position_model.freezed.dart';
part 'position_model.g.dart';

@JsonEnum()
enum PositionType {
  @JsonValue(0)
  production,
  @JsonValue(1)
  charging,
  @JsonValue(2)
  delivery,
  @JsonValue(3)
  rest,
}

extension PositionTypeExtension on PositionType {
  int get value {
    switch (this) {
      case PositionType.production:
        return 0;
      case PositionType.charging:
        return 1;
      case PositionType.delivery:
        return 2;
      case PositionType.rest:
        return 3;
      default:
        return -1;
    }
  }
}

@freezed
class PositionModel with _$PositionModel {
  const factory PositionModel({
    String? id,
    String? name,
    @JsonKey(name: 'id_type')
    PositionType? type,
    double? x,
    double? y,
    double? angle,

  }) = _PositionModel;

  factory PositionModel.fromJson(Map<String, dynamic> json) => _$PositionModelFromJson(json);
}

