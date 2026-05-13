import 'package:eventix/src/core/bloc/events/base.even.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/error.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
import 'package:eventix/src/features/perfil/domain/usecase/recuperar_perfil.usecase.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/events/recuperar_perfil.event.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/states/perfil.loaded.state.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/states/perfil.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerfilBloc extends Bloc<BaseEvent, BaseState> {
  final BuscarPerfilUseCase _buscarPerfilUseCase;

  PerfilBloc({required BuscarPerfilUseCase buscarPerfilUseCase})
    : _buscarPerfilUseCase = buscarPerfilUseCase,
      super(PerfilInitialState()) {
    on<BuscarPerfilEvent>(_recuperarPerfil);
  }

  Future<void> _recuperarPerfil(
    BuscarPerfilEvent event,
    Emitter<BaseState> emit,
  ) async {
    emit(LoadingState());
    try {
      final perfil = await _buscarPerfilUseCase.call();
      emit(PerfilLoadedState(perfil: perfil));
    } catch (e) {
      emit(ErrorState(message: 'Erro inesperado: ${e.toString()}'));
    }
  }
}
