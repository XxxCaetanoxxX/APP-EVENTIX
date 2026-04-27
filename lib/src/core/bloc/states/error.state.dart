import 'package:eventix/src/core/bloc/states/base.state.dart';

class ErrorState extends BaseState {
  final String message;

  ErrorState({required this.message});
}
