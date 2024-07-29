// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskStatusModelImpl _$$TaskStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TaskStatusModelImpl(
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$TaskStatusModelImplToJson(
        _$TaskStatusModelImpl instance) =>
    <String, dynamic>{
      'status': _$TaskStatusEnumMap[instance.status],
      'message': instance.message,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.success: 0,
  TaskStatus.ongoing: 1,
  TaskStatus.invalidStartPose: 2,
  TaskStatus.invalidGoalPose: 3,
  TaskStatus.startPoseJoinTopologyFailed: 4,
  TaskStatus.goalPoseJoinTopologyFailed: 5,
  TaskStatus.noTopologyIsSetted: 6,
  TaskStatus.nonLoopCloseTopology: 7,
  TaskStatus.controlFailure: 8,
  TaskStatus.tfError: 9,
  TaskStatus.failure: 10,
  TaskStatus.die: 11,
  TaskStatus.paused: 12,
  TaskStatus.done: 13,
};
