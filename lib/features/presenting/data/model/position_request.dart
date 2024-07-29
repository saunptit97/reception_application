import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_request.freezed.dart';
part 'position_request.g.dart';

@freezed
class PositionRequest with _$PositionRequest {
  const factory PositionRequest({
    double? x,
    double? y,
    double? angle,
    String? name,
    String? id,
    int? type
  }) = _PositionRequest;

  factory PositionRequest.fromJson(Map<String, dynamic> json) => _$PositionRequestFromJson(json);
}

