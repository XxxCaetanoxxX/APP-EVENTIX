import 'package:eventix/src/core/bloc/events/base.event.dart';
import 'package:eventix/src/features/home/domain/usecases/buscar_eventos.usecase.dart';

class BuscarEventosEvent extends BaseEvent {
  final BuscarEventosUseCaseParams? params;

  BuscarEventosEvent({this.params});
}
