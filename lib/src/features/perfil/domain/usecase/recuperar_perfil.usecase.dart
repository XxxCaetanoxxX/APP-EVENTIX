import 'package:eventix/src/core/domain/entities/user.entity.dart';
import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/features/perfil/domain/repository/perfil.repository.dart';

class BuscarPerfilUseCase
    implements UseCase<UserEntity, BuscarPerfilUseCaseParams> {
  final PerfilRepository _repository;

  BuscarPerfilUseCase({required PerfilRepository repository})
    : _repository = repository;

  @override
  Future<UserEntity> call({BuscarPerfilUseCaseParams? params}) async {
    return await _repository.getLoggedUser();
  }
}

class BuscarPerfilUseCaseParams {}
