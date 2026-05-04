import 'package:eventix/src/core/domain/entities/batch.entity.dart';
import 'package:eventix/src/core/domain/entities/mixins/audit.mixin.dart';

class TicketTypeEntity with AuditMixin {
  final int id;
  final String name;
  final int quantity;
  final int eventId;
  final List<BatchEntity>? batchs;

  TicketTypeEntity({
    required this.id,
    required this.name,
    required this.quantity,
    required this.eventId,
    this.batchs,
  });
}
