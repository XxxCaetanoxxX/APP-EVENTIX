import 'package:dio/dio.dart';
import 'package:eventix/src/config/client/dio_exception.extension.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/core/data/models/user.model.dart';
import 'package:eventix/src/core/domain/entities/user.entity.dart';
import 'package:logger/logger.dart';

abstract class PerfilDataSource {
  Future<UserEntity> getLoggedUser();
}

class PerfilDataSourceImpl implements PerfilDataSource {
  final EventixClient _client;
  var logger = Logger();

  PerfilDataSourceImpl({required EventixClient client}) : _client = client;

  @override
  Future<UserEntity> getLoggedUser() async {
    try {
      Response response = await _client.get('/users/me');

      logger.i(response.data);

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      //usa a extensao criada
      throw Exception(e.errorMessage);
    } catch (e) {
      logger.e("Erro de parser ou falha genérica: $e");
      throw Exception('Erro inesperado no aplicativo.');
    }
  }
}
