// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchModel _$BatchModelFromJson(Map<String, dynamic> json) =>
    BatchModel(
        id: (json['id'] as num).toInt(),
        ticketTypeId: (json['ticket_type_id'] as num).toInt(),
        name: json['name'] as String,
        price: (json['price'] as num).toDouble(),
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
        changes: json['changes'] as String?,
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

Map<String, dynamic> _$BatchModelToJson(BatchModel instance) =>
    <String, dynamic>{
      'dt_criacao': instance.dtCriacao?.toIso8601String(),
      'dt_alteracao': instance.dtAlteracao?.toIso8601String(),
      'operation': instance.operation,
      'endpoint_modificador': instance.endpointModificador,
      'nu_versao': instance.nuVersao,
      'modified_by_id': instance.modifiedById,
      'modified_by_name': instance.modifiedByName,
      'id': instance.id,
      'ticket_type_id': instance.ticketTypeId,
      'name': instance.name,
      'price': instance.price,
      'changes': instance.changes,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
