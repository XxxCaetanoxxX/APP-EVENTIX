import 'package:eventix/src/core/bloc/events/base.even.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
import 'package:eventix/src/features/login/domain/entities/login_request.entity.dart';
import 'package:eventix/src/features/login/domain/usecases/login_use_case.dart';
import 'package:eventix/src/features/login/presentation/bloc/events/logar.event.dart';
import 'package:eventix/src/features/login/presentation/bloc/states/error.login.state.dart';
import 'package:eventix/src/features/login/presentation/bloc/states/login_initial.state.dart';
import 'package:eventix/src/features/login/presentation/bloc/states/logado.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<BaseEvent, BaseState> {
  final LoginUseCase _loginUseCase;

  LoginBloc({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginInitialState()) {
    on<LogarEvent>(_logar);
  }

  Future<void> _logar(LogarEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    try {
      final params = LoginUseCaseParams(
        LoginRequestEntity(event.email, event.password),
      );
      final result = await _loginUseCase.call(params: params);
      if (result?.token != null) {
        emit(LogadoState());
      } else {
        emit(ErrorLoginState(result?.error ?? 'Usuário ou senha inválidos'));
      }
    } catch (e) {
      emit(ErrorLoginState('Erro inesperado: ${e.toString()}'));
    }
  }
}
