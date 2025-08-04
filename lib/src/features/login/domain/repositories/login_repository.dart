import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';

abstract class LoginRepository{
  Future<String?> login(LoginRequestEntity? loginRequestEntity);

  void logout();
}