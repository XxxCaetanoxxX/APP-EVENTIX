import 'package:dio/dio.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/features/login/domain/entities/login_result.entity.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class LoginDataSource {
  Future<LoginResult?> login(LoginRequestModel params);
  Future<void> logout();
}

class LoginDataSourceImpl implements LoginDataSource {
  final EventixClient _client;
  final Box _box;

  LoginDataSourceImpl({required client, required box})
    : _client = client,
      _box = box;

  @override
  Future<LoginResult?> login(LoginRequestModel params) async {
    try {
      Response response = await _client.post(
        '/users/login',
        data: params.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        await _box.put('accessToken', data['accessToken']);
        await _box.put('refreshToken', data['refreshToken']);
        return LoginResult(token: data['accessToken']);
      }

      return LoginResult(error: 'Erro inesperado');
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response?.data;
        if (data is Map) {
          final msg = data['message'];
          final message = msg is List ? msg.join(', ') : msg?.toString();
          return LoginResult(error: message ?? 'Erro inesperado');
        }
        return LoginResult(error: data?.toString() ?? 'Erro inesperado');
      }
      return LoginResult(error: 'Erro de conexão com o servidor');
    } catch (e) {
      return LoginResult(error: 'Erro interno: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    await _box.delete('accessToken');
    await _box.delete('refreshToken');
  }
}
