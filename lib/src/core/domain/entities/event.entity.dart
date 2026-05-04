import 'package:eventix/src/core/domain/entities/organizer.entity.dart';
import 'package:eventix/src/core/domain/entities/mixins/audit.mixin.dart';
import 'package:eventix/src/core/domain/entities/image.entity.dart';
import 'package:eventix/src/core/domain/entities/ticket_type.entity.dart';

class EventEntity with AuditMixin {
  final int? id;
  final String name;
  final int nuIngressos;
  final String? tpEvento;
  final DateTime dtStart;
  final DateTime dtEnd;
  final List<ImageEntity>? images;
  final OrganizerEntity? organizer;
  final List<TicketTypeEntity>? ticketTypes;

  EventEntity({
    this.id,
    required this.name,
    required this.nuIngressos,
    this.tpEvento,
    required this.dtStart,
    required this.dtEnd,
    this.images,
    this.organizer,
    this.ticketTypes,
  });
}
