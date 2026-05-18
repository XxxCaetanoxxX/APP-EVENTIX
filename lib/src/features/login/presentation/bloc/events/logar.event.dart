import 'package:eventix/src/core/bloc/events/base.event.dart';

class LogarEvent extends BaseEvent {
  final String email;
  final String password;
  LogarEvent({required this.email, required this.password});
}
