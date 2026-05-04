import 'package:eventix/src/core/data/models/batch.model.dart';
import 'package:eventix/src/core/domain/entities/ticket_type.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_type.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TicketTypeModel extends TicketTypeEntity {
  // eventId é camelCase na API, mas FieldRename.snake converteria para event_id.
  @JsonKey(name: 'eventId')
  @override
  final int eventId;

  @override
  final List<BatchModel>? batchs;

  TicketTypeModel({
    required super.id,
    required super.name,
    required super.quantity,
    required this.eventId,
    this.batchs,
  }) : super(eventId: eventId, batchs: batchs);

  factory TicketTypeModel.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketTypeModelToJson(this);
}
