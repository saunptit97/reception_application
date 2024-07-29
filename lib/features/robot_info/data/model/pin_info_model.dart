import 'package:freezed_annotation/freezed_annotation.dart';
part 'pin_info_model.freezed.dart';
part 'pin_info_model.g.dart';

@freezed
class PinInfoModel with _$PinInfoModel {
  const factory PinInfoModel({
    @JsonKey(name: "pin_level") int? pinLevel,
    @JsonKey(name: "pin_status") String? pinStatus,
    @JsonKey(name: "charging") bool? charging,

  }) = _PinInfoModel;

  factory PinInfoModel.fromJson(Map<String, dynamic> json) => _$PinInfoModelFromJson(json);
}
