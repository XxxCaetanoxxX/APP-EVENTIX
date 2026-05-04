// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_type.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketTypeModel _$TicketTypeModelFromJson(Map<String, dynamic> json) =>
    TicketTypeModel(
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
        quantity: (json['quantity'] as num).toInt(),
        eventId: (json['eventId'] as num).toInt(),
        batchs: (json['batchs'] as List<dynamic>?)
            ?.map((e) => BatchModel.fromJson(e as Map<String, dynamic>))
            .toList(),
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

Map<String, dynamic> _$TicketTypeModelToJson(TicketTypeModel instance) =>
    <String, dynamic>{
      'dt_criacao': instance.dtCriacao?.toIso8601String(),
      'dt_alteracao': instance.dtAlteracao?.toIso8601String(),
      'operation': instance.operation,
      'endpoint_modificador': instance.endpointModificador,
      'nu_versao': instance.nuVersao,
      'modified_by_id': instance.modifiedById,
      'modified_by_name': instance.modifiedByName,
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'eventId': instance.eventId,
      'batchs': instance.batchs?.map((e) => e.toJson()).toList(),
    };
