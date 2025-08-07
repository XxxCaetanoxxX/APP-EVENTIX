import 'package:eventix/src/core/classes/login_result.dart';
import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/features/login/data/models/login_request.model.dart';
import 'package:eventix/src/features/login/domain/repositories/login_repository.dart';

//a esquerda o que recebo do backend, a direita o que envio para o backend
class LoginUseCase implements UseCase<LoginResult?, LoginUseCaseParams> {
  LoginUseCase({required LoginRepository loginRepository})
    : _loginRepository = loginRepository;

  final LoginRepository _loginRepository;

  @override
  Future<LoginResult?> call({LoginUseCaseParams? params}) async {
    return await _loginRepository.login(params?.loginRequestModel);
  }
}

class LoginUseCaseParams {
  final LoginRequestModel loginRequestModel;

  LoginUseCaseParams(this.loginRequestModel);
}
