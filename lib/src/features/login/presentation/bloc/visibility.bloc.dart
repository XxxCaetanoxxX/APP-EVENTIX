import 'package:eventix/src/core/bloc/events/base.event.dart';
import 'package:eventix/src/features/login/presentation/bloc/events/change_visibility.event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityBloc extends Bloc<BaseEvent, bool> {
  VisibilityBloc() : super(true) {
    on<ChangePasswordVisibilityEvent>((event, emit) {
      emit(!state);
    });
  }
}
