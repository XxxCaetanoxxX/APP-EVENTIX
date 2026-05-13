import 'package:eventix/src/core/domain/entities/user.entity.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/states/perfil.state.dart';

class PerfilLoadedState extends PerfilState {
  final UserEntity perfil;

  PerfilLoadedState({required this.perfil});
}
