import 'package:eventix/src/core/domain/entities/mixins/audit.mixin.dart';

class BatchEntity with AuditMixin {
  final int id;
  final int ticketTypeId;
  final String name;
  final double price;
  final DateTime startDate;
  final DateTime endDate;
  final String? changes;

  BatchEntity({
    required this.id,
    required this.ticketTypeId,
    required this.name,
    required this.price,
    required this.startDate,
    required this.endDate,
    this.changes,
  });
}
