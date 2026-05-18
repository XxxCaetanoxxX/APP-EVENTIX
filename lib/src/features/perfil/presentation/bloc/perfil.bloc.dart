import 'package:eventix/src/core/bloc/events/base.event.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/error.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
import 'package:eventix/src/features/perfil/domain/usecase/atualizar_perfil.usecase.dart';
import 'package:eventix/src/features/perfil/domain/usecase/recuperar_perfil.usecase.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/events/atualizar_perfil.event.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/events/recuperar_perfil.event.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/states/perfil.loaded.state.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/states/perfil.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerfilBloc extends Bloc<BaseEvent, BaseState> {
  final BuscarPerfilUseCase _buscarPerfilUseCase;
  final AtualizarPerfilUseCase _atualizarPerfilUseCase;

  PerfilBloc({
    required BuscarPerfilUseCase buscarPerfilUseCase,
    required AtualizarPerfilUseCase atualizarPerfilUseCase,
  }) : _buscarPerfilUseCase = buscarPerfilUseCase,
       _atualizarPerfilUseCase = atualizarPerfilUseCase,
       super(PerfilInitialState()) {
    on<BuscarPerfilEvent>(_recuperarPerfil);
    on<AtualizarPerfilEvent>(_atualizarPerfil);
  }

  Future<void> _atualizarPerfil(
    AtualizarPerfilEvent event,
    Emitter<BaseState> emit,
  ) async {
    try {
      emit(LoadingState());

      final params = AtualizarPerfilUseCaseParams(
        id: event.id,
        email: event.email,
        name: event.name,
        phone: event.phone,
      );

      final perfil = await _atualizarPerfilUseCase.call(params: params);
      emit(PerfilLoadedState(perfil: perfil));
    } catch (e) {
      emit(ErrorState(message: 'Erro inesperado: ${e.toString()}'));
    }
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
