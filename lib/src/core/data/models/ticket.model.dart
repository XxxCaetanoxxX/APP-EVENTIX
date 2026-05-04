import 'package:eventix/src/core/data/models/batch.model.dart';
import 'package:eventix/src/core/data/models/ticket_type.model.dart';
import 'package:eventix/src/core/data/models/user.model.dart';
import 'package:eventix/src/core/domain/entities/ticket.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TicketModel extends TicketEntity {
  // Campos camelCase na API que o FieldRename.snake converteria errado.
  @JsonKey(name: 'ticketName')
  @override
  final String ticketName;

  @JsonKey(name: 'ticketTypeId')
  @override
  final int ticketTypeId;

  @JsonKey(name: 'userId')
  @override
  final int userId;

  @JsonKey(name: 'isUsed')
  @override
  final bool isUsed;

  // Relacionamentos opcionais (dependem do include da API)
  @override
  final BatchModel? batch;

  @override
  final TicketTypeModel? ticketType;

  @override
  final UserModel? user;

  TicketModel({
    required super.id,
    required this.ticketName,
    required super.batchId,
    required this.ticketTypeId,
    required this.userId,
    required super.code,
    required this.isUsed,
    super.dtValidation,
    this.batch,
    this.ticketType,
    this.user,
  }) : super(
          ticketName: ticketName,
          ticketTypeId: ticketTypeId,
          userId: userId,
          isUsed: isUsed,
          batch: batch,
          ticketType: ticketType,
          user: user,
        );

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}
