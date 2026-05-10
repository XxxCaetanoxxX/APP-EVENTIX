import 'package:eventix/src/core/domain/entities/user.entity.dart';

abstract class PerfilRepository {
  Future<UserEntity> getLoggedUser();
}
