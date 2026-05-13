import 'package:eventix/src/core/bloc/events/base.even.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/error.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
import 'package:eventix/src/features/home/domain/usecases/buscar_eventos.usecase.dart';
import 'package:eventix/src/features/home/presentation/bloc/events/buscar_eventos.event.dart';
import 'package:eventix/src/features/home/presentation/bloc/states/home_initial.state.dart';
import 'package:eventix/src/features/home/presentation/bloc/states/home_loaded.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<BaseEvent, BaseState> {
  final BuscarEventosUseCase _buscarEventosUseCase;

  HomeBloc({required BuscarEventosUseCase buscarEventosUseCase})
    : _buscarEventosUseCase = buscarEventosUseCase,
      super(HomeInitialState()) {
    on<BuscarEventosEvent>(_buscarEventos);
  }

  Future<void> _buscarEventos(
    BuscarEventosEvent event,
    Emitter<BaseState> emit,
  ) async {
    emit(LoadingState());
    try {
      final listaEventos = await _buscarEventosUseCase.call(params: event.params);
      emit(HomeLoadedState(listaEventos: listaEventos));
    } catch (e) {
      emit(ErrorState(message: 'Erro inesperado: ${e.toString()}'));
    }
  }
}
