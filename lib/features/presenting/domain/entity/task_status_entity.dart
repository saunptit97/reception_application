import '../../data/model/task_status_model.dart';

class TaskStatusEntity {
  TaskStatus? status;
  String? message;

  TaskStatusEntity({
    this.status,
    this.message,
  });

  factory TaskStatusEntity.fromModel(TaskStatusModel model) {
    return TaskStatusEntity(
      status: model.status,
      message: model.message,
    );
  }

  TaskStatusEntity copyWith({
    TaskStatus? status,
    String? message,
  }) {
    return TaskStatusEntity(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
