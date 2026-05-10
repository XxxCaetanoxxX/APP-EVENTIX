import 'package:eventix/src/core/domain/entities/user.entity.dart';
import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/features/perfil/domain/repository/perfil.repository.dart';

class RecuperarPerfilUseCase
    implements UseCase<UserEntity, RecuperarPerfilUseCaseParams> {
  final PerfilRepository _repository;

  RecuperarPerfilUseCase({required PerfilRepository repository})
    : _repository = repository;

  @override
  Future<UserEntity> call({RecuperarPerfilUseCaseParams? params}) async {
    return await _repository.getLoggedUser();
  }
}

class RecuperarPerfilUseCaseParams {}
