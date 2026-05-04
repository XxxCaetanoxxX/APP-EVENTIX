// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) =>
    UserModel(
        email: json['email'] as String,
        cpf: json['cpf'] as String?,
        phone: json['phone'] as String?,
        role: json['role'] as String,
        image: json['image'] == null
            ? null
            : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
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

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'dt_criacao': instance.dtCriacao?.toIso8601String(),
  'id': instance.id,
  'dt_alteracao': instance.dtAlteracao?.toIso8601String(),
  'name': instance.name,
  'operation': instance.operation,
  'endpoint_modificador': instance.endpointModificador,
  'nu_versao': instance.nuVersao,
  'modified_by_id': instance.modifiedById,
  'modified_by_name': instance.modifiedByName,
  'email': instance.email,
  'cpf': instance.cpf,
  'phone': instance.phone,
  'role': instance.role,
  'image': instance.image?.toJson(),
};
