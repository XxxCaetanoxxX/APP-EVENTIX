import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';
import 'package:eventix/src/features/login/domain/repositories/login_repository.dart';

class LoginUseCase implements UseCase<void, LoginUseCaseParams> {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  @override
  Future<void> call({LoginUseCaseParams? params}) async{
    await _loginRepository.login(params?.loginRequest);
  }
}

class LoginUseCaseParams{
  final LoginRequest loginRequest;

  LoginUseCaseParams(this.loginRequest);
}