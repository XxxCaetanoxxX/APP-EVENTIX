import 'package:eventix/src/features/home/data/models/organizer.model.dart';
import 'package:eventix/src/features/home/domain/entities/event.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class EventModel extends EventEntity {
  // Sobrescrevemos o organizer para tipá-lo como OrganizerModel (que possui o fromJson/toJson).
  // Se não fizermos isso, o json_serializable tentaria instanciar um OrganizerEntity puro e daria erro.
  @override
  final OrganizerModel? organizer;

  // Os parâmetros 'super.atributo' (Super Parameters) servem de atalho:
  // eles recebem o valor e já o passam automaticamente para o construtor da EventEntity (Pai).
  // O único que não usa o atalho é o 'this.organizer', por isso precisamos passá-lo manualmente
  // lá no final usando o ': super(organizer: organizer)' para que o Pai seja construído corretamente.
  EventModel({
    super.id,
    required super.name,
    required super.nuIngressos,
    required super.tpEvento,
    required super.dtStart,
    required super.dtEnd,
    super.dtCriacao,
    super.dtAlteracao,
    super.operation,
    super.endpointModificador,
    super.nuVersao,
    super.modifiedById,
    super.modifiedByName,
    required super.images,
    this.organizer,
  }) : super(organizer: organizer);

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
