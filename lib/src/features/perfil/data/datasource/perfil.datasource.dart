import 'package:dio/dio.dart';
import 'package:eventix/src/config/client/dio_exception.extension.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/core/data/models/user.model.dart';
import 'package:eventix/src/core/domain/entities/user.entity.dart';
import 'package:eventix/src/features/perfil/domain/usecase/atualizar_perfil.usecase.dart';
import 'package:logger/logger.dart';

abstract class PerfilDataSource {
  Future<UserEntity> getLoggedUser();
  Future<UserEntity> updateUser(AtualizarPerfilUseCaseParams? params);
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

  @override
  Future<UserEntity> updateUser(AtualizarPerfilUseCaseParams? params) async {
    try {
      Response response = await _client.patch(
        '/users/${params!.id}',
        data: {
          "name": params.name,
          "email": params.email,
          "phone": params.phone,
        },
      );

      logger.i(response.data);
      
      final data = response.data['data'];

      return UserModel.fromJson(data);
    } on DioException catch (e) {
      throw Exception(e.errorMessage);
    } catch (e) {
      logger.e("Erro de parser ou falha genérica: $e");
      throw Exception('Erro inesperado no aplicativo.');
    }
  }
}
