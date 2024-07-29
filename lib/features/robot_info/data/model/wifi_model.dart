import 'package:freezed_annotation/freezed_annotation.dart';
part 'wifi_model.freezed.dart';
part 'wifi_model.g.dart';

@freezed
class WifiModel with _$WifiModel {
  const factory WifiModel({
    String? ip,
    @JsonKey(name: 'wifi_name') String? wifiName,

  }) = _WifiModel;

  factory WifiModel.fromJson(Map<String, dynamic> json) => _$WifiModelFromJson(json);
}

