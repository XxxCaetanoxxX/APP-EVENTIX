mixin AuditMixin {
  DateTime? dtCriacao;
  DateTime? dtAlteracao;
  String? operation;
  String? endpointModificador;
  int? nuVersao;
  int? modifiedById;
  String? modifiedByName;
}
