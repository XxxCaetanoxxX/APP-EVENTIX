import 'package:eventix/src/core/domain/entities/user.entity.dart';
import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/features/perfil/domain/repository/perfil.repository.dart';

class AtualizarPerfilUseCase
    implements UseCase<UserEntity, AtualizarPerfilUseCaseParams> {
  final PerfilRepository _repository;

  AtualizarPerfilUseCase({required PerfilRepository repository})
    : _repository = repository;

  @override
  Future<UserEntity> call({AtualizarPerfilUseCaseParams? params}) async {
    return await _repository.updateUser(params);
  }
}

class AtualizarPerfilUseCaseParams {
  final int id;
  final String? name;
  final String? email;
  final String? phone;

  AtualizarPerfilUseCaseParams({
    required this.id,
    this.name,
    this.email,
    this.phone,
  });
}
