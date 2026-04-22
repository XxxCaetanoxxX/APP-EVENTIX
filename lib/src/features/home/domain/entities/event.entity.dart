import 'package:eventix/src/features/home/domain/entities/organizer.entity.dart';

class EventEntity {
  final int? id;
  final String name;
  final int nuIngressos;
  final String tpEvento;
  final DateTime dtStart;
  final DateTime dtEnd;
  final DateTime? dtCriacao;
  final DateTime? dtAlteracao;
  final String? operation;
  final String? endpointModificador;
  final int? nuVersao;
  final int? modifiedById;
  final String? modifiedByName;
  final List<dynamic> images;
  final OrganizerEntity? organizer;

  EventEntity({
    this.id,
    required this.name,
    required this.nuIngressos,
    required this.tpEvento,
    required this.dtStart,
    required this.dtEnd,
    this.dtCriacao,
    this.dtAlteracao,
    this.operation,
    this.endpointModificador,
    this.nuVersao,
    this.modifiedById,
    this.modifiedByName,
    required this.images,
    this.organizer,
  });
}
