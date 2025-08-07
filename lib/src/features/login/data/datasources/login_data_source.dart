import 'package:dio/dio.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/core/classes/login_result.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class LoginDataSource {
  Future<LoginResult?> login(LoginRequestModel params);
}

class LoginDataSourceImpl implements LoginDataSource {
  final EventixClient _client;
  final Box _box;

  LoginDataSourceImpl({required client, required box}): _client = client, _box = box;

  @override
  Future<LoginResult?> login(LoginRequestModel params) async {
    try {
      Response response = await _client.post(
        '/users/login',
        data: LoginRequestModel(params.email, params.password).toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        await _box.put('token', response.data);
        return LoginResult(token: response.data);
      }

      return LoginResult(error: 'Erro inesperado');
    } on DioException catch (e) {
      print(e);
      final backendMessage = e.response?.data['message'];
      return LoginResult(error: backendMessage ?? 'Erro desconhecido');
    } catch (e) {
      print(e);
      return LoginResult(error: 'Erro interno: ${e.toString()}');
    }
  }
}
