import 'package:eventix/src/core/data/models/image.model.dart';
import 'package:eventix/src/core/domain/entities/user.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserModel extends UserEntity {
  @override
  final ImageModel? image;

  UserModel({
    required super.email,
    super.cpf,
    super.phone,
    required super.role,
    this.image,
    required super.id,
    required super.name,
  }) : super(image: image);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
