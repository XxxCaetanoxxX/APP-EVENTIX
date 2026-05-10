import 'package:eventix/src/features/login/domain/entities/login_result.entity.dart';
import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';
import 'package:eventix/src/features/login/domain/repositories/login.repository.dart';

//a esquerda o que recebo do backend, a direita o que envio para o backend
class LoginUseCase implements UseCase<LoginResult?, LoginUseCaseParams> {
  LoginUseCase({required LoginRepository loginRepository})
    : _loginRepository = loginRepository;

  final LoginRepository _loginRepository;

  @override
  Future<LoginResult?> call({LoginUseCaseParams? params}) async {
    return await _loginRepository.login(params?.loginRequestEntity);
  }
}

class LoginUseCaseParams {
  //TODO: remover entity daqui, pois esta arquiteturalmente errado
  final LoginRequestEntity loginRequestEntity;

  LoginUseCaseParams(this.loginRequestEntity);
}
