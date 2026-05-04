import 'package:eventix/src/core/domain/entities/image.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageModel extends ImageEntity {
  // userId e eventId são camelCase na API, precisamos do @JsonKey.
  @JsonKey(name: 'userId')
  @override
  final int? userId;

  @JsonKey(name: 'eventId')
  @override
  final int? eventId;

  ImageModel({
    required super.id,
    this.userId,
    this.eventId,
    required super.path,
  }) : super(userId: userId, eventId: eventId);

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
