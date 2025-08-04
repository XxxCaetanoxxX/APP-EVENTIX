import 'package:dio/dio.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/core/classes/login_result.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';

abstract class LoginDataSource {
  Future<LoginResult?> login(LoginRequestEntity params);
}

class LoginDataSourceImpl implements LoginDataSource {
  final EventixClient client;

  LoginDataSourceImpl(this.client);

  @override
  Future<LoginResult?> login(LoginRequestEntity params) async {
    try {
      Response response = await client.post(
        '/users/login',
        data: LoginRequestModel(params.email, params.password).toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }

      return LoginResult(error: 'Erro inesperado');
    } on DioException catch (e) {
      final backendMessage = e.response?.data['message'];
      return LoginResult(error: backendMessage ?? 'Erro desconhecido');
    } catch (e) {
      return LoginResult(error: 'Erro interno: ${e.toString()}');
    }
  }
}
