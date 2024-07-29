import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_status_model.freezed.dart';
part 'task_status_model.g.dart';


@JsonEnum()
enum TaskStatus {
  @JsonValue(0)
  success,
  @JsonValue(1)
  ongoing,
  @JsonValue(2)
  invalidStartPose,
  @JsonValue(3)
  invalidGoalPose,
  @JsonValue(4)
  startPoseJoinTopologyFailed,
  @JsonValue(5)
  goalPoseJoinTopologyFailed,
  @JsonValue(6)
  noTopologyIsSetted,
  @JsonValue(7)
  nonLoopCloseTopology,
  @JsonValue(8)
  controlFailure,
  @JsonValue(9)
  tfError,
  @JsonValue(10)
  failure,
  @JsonValue(11)
  die,
  @JsonValue(12)
  paused,
  @JsonValue(13)
  done
}

@freezed
class TaskStatusModel with _$TaskStatusModel {
  const factory TaskStatusModel({
    TaskStatus? status,
    String? message,

  }) = _TaskStatusModel;

  factory TaskStatusModel.fromJson(Map<String, dynamic> json) => _$TaskStatusModelFromJson(json);
}

