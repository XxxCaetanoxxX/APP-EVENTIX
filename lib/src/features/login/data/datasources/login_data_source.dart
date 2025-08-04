import 'package:dio/dio.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';

abstract class LoginDataSource {
  Future<String?> login(LoginRequestEntity params);
}

class LoginDataSourceImpl implements LoginDataSource {
  final Dio dio;

  LoginDataSourceImpl(this.dio);
  

  @override
  Future<String?> login(LoginRequestEntity params) async{
    try {
      final response = await dio.post(
        'https://projectsync-evkq.onrender.com/users/login', // exemplo de rota
        data: LoginRequestModel(params.email, params.password).toJson(),
      );

      print(response);

      if (response.statusCode == 200) {
        return response.data['token']; // ou conforme a resposta da API
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}