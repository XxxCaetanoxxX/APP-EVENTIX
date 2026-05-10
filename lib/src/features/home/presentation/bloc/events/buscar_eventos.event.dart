import 'package:eventix/src/core/bloc/events/base.even.dart';
import 'package:eventix/src/features/home/domain/usecases/home.usecase.dart';

class BuscarEventosEvent extends BaseEvent {
  final HomeUseCaseParams? params;

  BuscarEventosEvent({this.params});
}
