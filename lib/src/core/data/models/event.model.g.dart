// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) =>
    EventModel(
        id: (json['id'] as num?)?.toInt(),
        name: json['name'] as String,
        nuIngressos: (json['nu_ingressos'] as num).toInt(),
        tpEvento: json['tp_evento'] as String?,
        dtStart: DateTime.parse(json['dt_start'] as String),
        dtEnd: DateTime.parse(json['dt_end'] as String),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        organizer: json['organizer'] == null
            ? null
            : OrganizerModel.fromJson(
                json['organizer'] as Map<String, dynamic>,
              ),
        ticketTypes: (json['ticketTypes'] as List<dynamic>?)
            ?.map((e) => TicketTypeModel.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
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
      'nu_ingressos': instance.nuIngressos,
      'tp_evento': instance.tpEvento,
      'dt_start': instance.dtStart.toIso8601String(),
      'dt_end': instance.dtEnd.toIso8601String(),
      'organizer': instance.organizer?.toJson(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'ticketTypes': instance.ticketTypes?.map((e) => e.toJson()).toList(),
    };
