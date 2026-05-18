import 'package:eventix/src/features/perfil/presentation/bloc/events/perfil.event.dart';

class AtualizarPerfilEvent extends PerfilEvent {
  final int id;
  final String? name;
  final String? email;
  final String? phone;

  AtualizarPerfilEvent({required this.id, this.name, this.email, this.phone});
}
