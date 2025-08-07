import 'package:eventix/src/features/login/presentation/bloc/states/login_initial.state.dart';

class ErrorLoginState extends LoginState{
  final String message;
  ErrorLoginState(this.message);
}