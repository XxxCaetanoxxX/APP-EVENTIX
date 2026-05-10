import 'package:eventix/src/features/login/domain/entities/login_result.entity.dart';
import 'package:eventix/src/features/login/data/datasources/login.datasource.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';
import 'package:eventix/src/features/login/domain/repositories/login.repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryImpl({required LoginDataSource loginDataSource})
    : _loginDataSource = loginDataSource;

  @override
  Future<LoginResult?> login(LoginRequestEntity? loginRequestEntity) async {
    final model = LoginRequestModel(
      loginRequestEntity!.email,
      loginRequestEntity.password,
    );
    return await _loginDataSource.login(model);
  }

  @override
  Future<void> logout() async {
    await _loginDataSource.logout();
  }
}
