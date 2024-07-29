// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      heightFeet: json['heightFeet'] as String?,
      heightInches: json['heightInches'] as String?,
      lastName: json['lastName'] as String?,
      position: json['position'] as String?,
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      weightPounds: json['weightPounds'] as String?,
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'heightFeet': instance.heightFeet,
      'heightInches': instance.heightInches,
      'lastName': instance.lastName,
      'position': instance.position,
      'team': instance.team,
      'weightPounds': instance.weightPounds,
    };

_$TeamImpl _$$TeamImplFromJson(Map<String, dynamic> json) => _$TeamImpl(
      id: (json['id'] as num?)?.toInt(),
      abbreviation: json['abbreviation'] as String?,
      city: json['city'] as String?,
      conference: json['conference'] as String?,
      division: json['division'] as String?,
      fullName: json['fullName'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$TeamImplToJson(_$TeamImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'abbreviation': instance.abbreviation,
      'city': instance.city,
      'conference': instance.conference,
      'division': instance.division,
      'fullName': instance.fullName,
      'name': instance.name,
    };
