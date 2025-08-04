import 'package:eventix/src/features/login/domain/usecases/login_use_case.dart';
import 'package:eventix/src/features/login/presentation/bloc/events/login.event.dart';

class LogarEvent extends LoginEvent{
  final LoginUseCaseParams params;
  LogarEvent(this.params);
}