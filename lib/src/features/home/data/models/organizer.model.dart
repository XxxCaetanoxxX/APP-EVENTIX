import 'package:eventix/src/features/home/domain/entities/organizer.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organizer.model.g.dart';

@JsonSerializable()
class OrganizerModel extends OrganizerEntity {
  OrganizerModel({required super.id, required super.name});

  factory OrganizerModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizerModelToJson(this);
}
