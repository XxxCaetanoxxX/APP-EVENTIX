import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/features/login/domain/repositories/login_repository.dart';

class LogOutUseCase implements UseCase<void, void> {
  final LoginRepository _loginRepository;

  LogOutUseCase({required loginRepository})
    : _loginRepository = loginRepository;

  @override
  Future<void> call({void params}) async {
    _loginRepository.logout();
  }
}
