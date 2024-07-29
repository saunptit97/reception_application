import '../../data/model/file_model.dart';
import 'location_entity.dart';

class FileEntity {
  final int? fileId;
  final String? name;
  final int? status;
  final String? url;
  final String? processingDate;
  String? localFilePath;

  FileEntity({
    this.fileId,
    this.name,
    this.status,
    this.url,
    this.processingDate,
    this.localFilePath,
  });

  factory FileEntity.fromModel(FileModel model) {
    return FileEntity(
      fileId: model.fileId,
      name: model.name,
      status: model.status,
      url: model.url,
      processingDate: model.processingDate,
    );
  }

  Map<String, dynamic> toJson() => {
    'fileId': fileId,
    'name': name,
    'status': status,
    'url': url,
    'processingDate': processingDate,
    'localFilePath': localFilePath,
  };

  factory FileEntity.fromJson(Map<String, dynamic> json) {
    return FileEntity(
      fileId: json['fileId'],
      name: json['name'],
      status: json['status'],
      url: json['url'],
      processingDate: json['processingDate'],
      localFilePath: json['localFilePath'],
    );
  }

  MediaType getMediaType() {
    if ((name?.contains('.mp3') ?? false) || (name?.contains('.wav') ?? false)) {
      return MediaType.audio;
    } else if ((name?.contains('.mp4')) ?? false) {
      return MediaType.video;
    } else {
      return MediaType.unknown;
    }
  }
}