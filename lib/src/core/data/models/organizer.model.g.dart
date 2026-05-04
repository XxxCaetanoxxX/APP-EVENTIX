// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizerModel _$OrganizerModelFromJson(Map<String, dynamic> json) =>
    OrganizerModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$OrganizerModelToJson(OrganizerModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
