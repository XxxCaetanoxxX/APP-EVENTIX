import 'package:eventix/src/core/data/models/organizer.model.dart';
import 'package:eventix/src/core/data/models/image.model.dart';
import 'package:eventix/src/core/data/models/ticket_type.model.dart';
import 'package:eventix/src/core/domain/entities/event.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class EventModel extends EventEntity {
  @override
  final OrganizerModel? organizer;

  @override
  final List<ImageModel>? images;

  // ticketTypes é camelCase na API, mas FieldRename.snake converteria para ticket_types.
  @JsonKey(name: 'ticketTypes')
  @override
  final List<TicketTypeModel>? ticketTypes;

  EventModel({
    super.id,
    required super.name,
    required super.nuIngressos,
    super.tpEvento,
    required super.dtStart,
    required super.dtEnd,
    this.images,
    this.organizer,
    this.ticketTypes,
  }) : super(organizer: organizer, images: images, ticketTypes: ticketTypes);

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
