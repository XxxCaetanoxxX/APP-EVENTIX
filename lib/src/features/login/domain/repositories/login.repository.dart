import 'package:eventix/src/features/login/domain/entities/login_result.entity.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';

abstract class LoginRepository {
  Future<LoginResult?> login(LoginRequestEntity? loginRequestEntity);

  Future<void> logout();
}
