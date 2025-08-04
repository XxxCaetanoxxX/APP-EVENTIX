import 'package:eventix/src/core/classes/login_result.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';

abstract class LoginRepository{
  Future<LoginResult?> login(LoginRequestEntity? loginRequestEntity);

  void logout();
}