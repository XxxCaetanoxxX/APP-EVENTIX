import 'package:eventix/main.dart';
import 'package:eventix/src/features/login/presentation/bloc/visibility.bloc.dart';

void initLogin() {
  getIt.registerFactory(() => VisibilityBloc());
}
