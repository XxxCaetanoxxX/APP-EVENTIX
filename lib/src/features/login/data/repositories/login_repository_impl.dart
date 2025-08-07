import 'package:eventix/src/core/classes/login_result.dart';
import 'package:eventix/src/features/login/data/datasources/login_data_source.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';
import 'package:eventix/src/features/login/domain/repositories/login_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;
  final Box _box;

  LoginRepositoryImpl({required loginDataSource, required box}) : _loginDataSource = loginDataSource, _box = box;

  @override
  Future<LoginResult?> login(LoginRequestModel? loginRequestModel) async {
    return await _loginDataSource.login(loginRequestModel!);
  }

  @override
  Future<void> logout() async{
    print('passando pelo repository');
   await _box.delete('token');
  }
}