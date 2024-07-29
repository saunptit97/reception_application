import 'location_entity.dart';

class MediaEntity {
  final String? id;
  final String? name;
  final String? url;
  final MediaType? type;
  String? filePath;

  MediaEntity({
    this.id,
    this.name,
    this.url,
    this.type,
    this.filePath,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'url': url,
    'type': type?.value,
    'filePath': filePath
  };

  factory MediaEntity.fromJson(Map<String, dynamic> json) {
    return MediaEntity(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      type: MediaType.values.firstWhere((element) => element.value == json['type']),
      filePath: json['filePath'],
    );
  }
}
