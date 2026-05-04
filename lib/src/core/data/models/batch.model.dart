import 'package:eventix/src/core/domain/entities/batch.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BatchModel extends BatchEntity {
  // startDate e endDate são camelCase na API, mas FieldRename.snake
  // converteria para start_date/end_date. Precisamos do @JsonKey para corrigir.
  @JsonKey(name: 'startDate')
  @override
  final DateTime startDate;

  @JsonKey(name: 'endDate')
  @override
  final DateTime endDate;

  BatchModel({
    required super.id,
    required super.ticketTypeId,
    required super.name,
    required super.price,
    required this.startDate,
    required this.endDate,
    super.changes,
  }) : super(startDate: startDate, endDate: endDate);

  factory BatchModel.fromJson(Map<String, dynamic> json) =>
      _$BatchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BatchModelToJson(this);
}
