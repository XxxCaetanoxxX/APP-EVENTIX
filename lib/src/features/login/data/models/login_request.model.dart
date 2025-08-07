import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.model.g.dart';

@JsonSerializable()
class LoginRequestModel extends LoginRequestEntity{
  const LoginRequestModel(super.email, super.password);

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

} 