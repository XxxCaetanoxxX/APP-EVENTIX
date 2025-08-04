import 'package:dio/dio.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';

abstract class LoginDataSource {
  Future<String?> login(LoginRequestEntity params);
}

class LoginDataSourceImpl implements LoginDataSource {
  final EventixClient client;

  LoginDataSourceImpl(this.client);

  @override
  Future<String?> login(LoginRequestEntity params) async {
    try {
      Response response = await client.post(
        '/users/login',
        data: LoginRequestModel(params.email, params.password).toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data is String) {
          return response.data;
        }
      }

      return null;
    } catch (e) {
      print('Erro na requisição: $e');
      return null;
    }
  }
}
