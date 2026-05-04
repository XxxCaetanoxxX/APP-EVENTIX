import 'package:eventix/src/core/domain/entities/batch.entity.dart';
import 'package:eventix/src/core/domain/entities/mixins/audit.mixin.dart';
import 'package:eventix/src/core/domain/entities/ticket_type.entity.dart';
import 'package:eventix/src/core/domain/entities/user.entity.dart';

class TicketEntity with AuditMixin {
  final int id;
  final String ticketName;
  final int batchId;
  final int ticketTypeId;
  final int userId;
  final String code;
  final bool isUsed;
  final DateTime? dtValidation;
  final BatchEntity? batch;
  final TicketTypeEntity? ticketType;
  final UserEntity? user;

  TicketEntity({
    required this.id,
    required this.ticketName,
    required this.batchId,
    required this.ticketTypeId,
    required this.userId,
    required this.code,
    required this.isUsed,
    this.dtValidation,
    this.batch,
    this.ticketType,
    this.user,
  });
}
