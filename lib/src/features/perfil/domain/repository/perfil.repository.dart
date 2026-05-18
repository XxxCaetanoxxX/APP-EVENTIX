import 'package:eventix/src/core/domain/entities/user.entity.dart';
import 'package:eventix/src/features/perfil/domain/usecase/atualizar_perfil.usecase.dart';

abstract class PerfilRepository {
  Future<UserEntity> getLoggedUser();
  Future<UserEntity> updateUser(AtualizarPerfilUseCaseParams? params);
}
