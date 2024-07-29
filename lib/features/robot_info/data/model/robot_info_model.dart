import 'package:freezed_annotation/freezed_annotation.dart';
part 'robot_info_model.freezed.dart';
part 'robot_info_model.g.dart';

@freezed
class RobotInfoModel with _$RobotInfoModel {
  const factory RobotInfoModel({
    @JsonKey(name: "robot_id") String? robotId,
    @JsonKey(name: "nav_version") String? navVersion,

  }) = _RobotInfoModel;

  factory RobotInfoModel.fromJson(Map<String, dynamic> json) => _$RobotInfoModelFromJson(json);
}