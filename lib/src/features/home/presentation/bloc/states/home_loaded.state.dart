import 'package:eventix/src/core/domain/entities/event.entity.dart';
import 'package:eventix/src/features/home/presentation/bloc/states/home_initial.state.dart';

class HomeLoadedState extends HomeState {
  final List<EventEntity> listaEventos;

  HomeLoadedState({required this.listaEventos});
}
