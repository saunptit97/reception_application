import '../../../setup_locations/domain/entity/file_entity.dart';
import '../../data/model/position_model.dart';
import '../../data/model/task_status_model.dart';

class PositionEntity {
  final String? id;
  final String? name;
  final PositionType? type;
  final double? x;
  final double? y;
  final double? angle;
  late TaskStatus? status;
  late DateTime? startedAt;
  FileEntity? file;

  PositionEntity({
    this.id,
    this.name,
    this.type,
    this.x,
    this.y,
    this.angle,
    this.status,
    this.startedAt,
    this.file,
  });

  factory PositionEntity.fromModel(PositionModel model) {
    return PositionEntity(
      id: model.id,
      name: model.name,
      type: model.type,
      x: model.x,
      y: model.y,
      angle: model.angle,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type?.name,
    'x': x,
    'y': y,
    'angle': angle,
    'status': status?.name,
    'startedAt': startedAt?.toIso8601String(),
    'file': file?.toJson(),
  };

  factory PositionEntity.fromJson(Map<String, dynamic> json) {
    return PositionEntity(
      id: json['id'],
      name: json['name'],
      type: json['type'] != null ? PositionType.values.firstWhere((element) => element.name == json['type']) : null,
      x: json['x'],
      y: json['y'],
      angle: json['angle'],
      status: json['status'] != null ? TaskStatus.values.firstWhere((element) => element.name == json['status']) : null,
      startedAt:json['startedAt'] != null ?  DateTime.tryParse(json['startedAt']) : null,
      file: json['file'] != null ? FileEntity.fromJson(json['file']) : null,
    );
  }
}
