import 'package:eventix/src/features/login/data/datasources/login_data_source.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';
import 'package:eventix/src/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryImpl({required loginDataSource}) : _loginDataSource = loginDataSource;

  @override
  Future<void> login(LoginRequestEntity? loginRequestEntity) async {
    await _loginDataSource.login(loginRequestEntity!);
  }

  @override
  void logout() {

  }
}