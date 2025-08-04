import 'package:eventix/src/core/bloc/events/base.even.dart';
import 'package:eventix/src/core/bloc/states/base.state.dart';
import 'package:eventix/src/core/bloc/states/loading.state.dart';
import 'package:eventix/src/features/login/domain/usecases/login_use_case.dart';
import 'package:eventix/src/features/login/presentation/bloc/events/logar.event.dart';
import 'package:eventix/src/features/login/presentation/bloc/states/login_initica.state.dart';
import 'package:eventix/src/features/login/presentation/bloc/states/teste.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<BaseEvent, BaseState> {
  final LoginUseCase _loginUseCase;

  LoginBloc({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginInitialState()) {
        on<LogarEvent>(_logar);
      }

      Future<void> _logar(LogarEvent event, Emitter<BaseState> emit) async{
        emit(LoadingState());
        await _loginUseCase.call(params: event.params);
        emit(TesteState());
      }
}
