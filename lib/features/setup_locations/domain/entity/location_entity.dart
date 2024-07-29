import 'package:freezed_annotation/freezed_annotation.dart';

import 'media_entity.dart';

@JsonEnum()
enum MediaType {
  @JsonValue('audio')
  audio,
  @JsonValue('video')
  video,
  @JsonValue('unknown')
  unknown
}

extension MediaTypeExtension on MediaType {
  String get value {
    switch (this) {
      case MediaType.audio:
        return 'audio';
      case MediaType.video:
        return 'video';
      default:
        return '';
    }
  }
}

@JsonEnum()
enum LocationStatus {
  @JsonValue('idle')
  idle,
  @JsonValue('going')
  going,
  @JsonValue('arrived')
  arrived,
  @JsonValue('presenting')
  presenting,
  @JsonValue('done')
  done,
  @JsonValue('cancel')
  cancel,
}

extension LocationStatusExtension on LocationStatus {
  String get value {
    switch (this) {
      case LocationStatus.idle:
        return 'idle';
      case LocationStatus.going:
        return 'going';
      case LocationStatus.arrived:
        return 'arrived';
      case LocationStatus.presenting:
        return 'presenting';
      case LocationStatus.done:
        return 'done';
      case LocationStatus.cancel:
        return 'cancel';
      default:
        return '';
    }
  }
}

class LocationEntity {
  final String? id;
  final String? name;
  final String? description;
  final double? x;
  final double? y;
  final double? angle;
  LocationStatus? status;
  MediaEntity? media;


  LocationEntity({
    this.id,
    this.name,
    this.description,
    this.x,
    this.y,
    this.angle,
    this.status = LocationStatus.idle,
    this.media,
  });

  set setMedia(MediaEntity? media) {
    this.media = media;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'x': x,
    'y': y,
    'angle': angle,
    'status': status?.value,
    'media': media?.toJson(),
  };

  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return LocationEntity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      x: json['x'],
      y: json['y'],
      angle: json['angle'],
      status: LocationStatus.values.firstWhere((element) => element.value == json['status']),
      media: json['media'] != null ? MediaEntity.fromJson(json['media']) : null,
    );
  }
}
