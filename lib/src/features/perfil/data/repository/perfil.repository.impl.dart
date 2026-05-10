import 'package:eventix/src/core/domain/entities/user.entity.dart';
import 'package:eventix/src/features/perfil/data/datasource/perfil.datasource.dart';
import 'package:eventix/src/features/perfil/domain/repository/perfil.repository.dart';

class PerfilRepositoryImpl implements PerfilRepository {
  final PerfilDataSource _dataSource;

  PerfilRepositoryImpl({required PerfilDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<UserEntity> getLoggedUser() async {
    return await _dataSource.getLoggedUser();
  }
}
