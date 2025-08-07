import 'package:eventix/main.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/features/login/data/datasources/login_data_source.dart';
import 'package:eventix/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:eventix/src/features/login/domain/repositories/login_repository.dart';
import 'package:eventix/src/features/login/domain/usecases/login_use_case.dart';
import 'package:eventix/src/features/login/presentation/bloc/login.bloc.dart';
import 'package:hive_flutter/adapters.dart';

void initLogin() {
  //bloc
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(loginUseCase: sl<LoginUseCase>()),
  );

  //usecase
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(loginRepository: sl<LoginRepository>()),
  );

  //repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(loginDataSource: sl<LoginDataSource>()),
  );

  //data source
  sl.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(box: sl<Box>(), client: sl<EventixClient>()),
  );
}
