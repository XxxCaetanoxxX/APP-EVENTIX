// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) =>
    TicketModel(
        id: (json['id'] as num).toInt(),
        ticketName: json['ticketName'] as String,
        batchId: (json['batch_id'] as num).toInt(),
        ticketTypeId: (json['ticketTypeId'] as num).toInt(),
        userId: (json['userId'] as num).toInt(),
        code: json['code'] as String,
        isUsed: json['isUsed'] as bool,
        dtValidation: json['dt_validation'] == null
            ? null
            : DateTime.parse(json['dt_validation'] as String),
        batch: json['batch'] == null
            ? null
            : BatchModel.fromJson(json['batch'] as Map<String, dynamic>),
        ticketType: json['ticket_type'] == null
            ? null
            : TicketTypeModel.fromJson(
                json['ticket_type'] as Map<String, dynamic>,
              ),
        user: json['user'] == null
            ? null
            : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      )
      ..dtCriacao = json['dt_criacao'] == null
          ? null
          : DateTime.parse(json['dt_criacao'] as String)
      ..dtAlteracao = json['dt_alteracao'] == null
          ? null
          : DateTime.parse(json['dt_alteracao'] as String)
      ..operation = json['operation'] as String?
      ..endpointModificador = json['endpoint_modificador'] as String?
      ..nuVersao = (json['nu_versao'] as num?)?.toInt()
      ..modifiedById = (json['modified_by_id'] as num?)?.toInt()
      ..modifiedByName = json['modified_by_name'] as String?;

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'dt_criacao': instance.dtCriacao?.toIso8601String(),
      'dt_alteracao': instance.dtAlteracao?.toIso8601String(),
      'operation': instance.operation,
      'endpoint_modificador': instance.endpointModificador,
      'nu_versao': instance.nuVersao,
      'modified_by_id': instance.modifiedById,
      'modified_by_name': instance.modifiedByName,
      'id': instance.id,
      'batch_id': instance.batchId,
      'code': instance.code,
      'dt_validation': instance.dtValidation?.toIso8601String(),
      'ticketName': instance.ticketName,
      'ticketTypeId': instance.ticketTypeId,
      'userId': instance.userId,
      'isUsed': instance.isUsed,
      'batch': instance.batch?.toJson(),
      'ticket_type': instance.ticketType?.toJson(),
      'user': instance.user?.toJson(),
    };
