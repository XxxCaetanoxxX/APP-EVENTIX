import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';

abstract class LoginRepository{
  Future<void> login(LoginRequestEntity? loginRequestEntity);

  void logout();
}