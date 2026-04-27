import 'package:eventix/main.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/features/home/data/datasource/home_data_source.dart';
import 'package:eventix/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:eventix/src/features/home/domain/repositories/home_repository.dart';
import 'package:eventix/src/features/home/domain/usecases/home_use_case.dart';
import 'package:eventix/src/features/home/presentation/bloc/home.bloc.dart';

void initHome() {
  //data source
  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(client: sl<EventixClient>()),
  );

  //repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(dataSource: sl<HomeDataSource>()),
  );

  //usecase
  sl.registerLazySingleton<HomeUseCase>(
    () => HomeUseCase(homeRepository: sl<HomeRepository>()),
  );

  //bloc
  sl.registerFactory<HomeBloc>(() => HomeBloc(homeUseCase: sl<HomeUseCase>()));
}
