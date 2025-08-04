import 'package:eventix/src/core/classes/login_result.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';

abstract class LoginRepository{
  Future<LoginResult?> login(LoginRequestModel? loginRequestModel);

  void logout();
}