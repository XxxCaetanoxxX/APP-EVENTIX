import 'package:eventix/main.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/features/home/data/datasource/home.datasource.dart';
import 'package:eventix/src/features/home/data/repositories/home.repository_impl.dart';
import 'package:eventix/src/features/home/domain/repositories/home.repository.dart';
import 'package:eventix/src/features/home/domain/usecases/buscar_eventos.usecase.dart';
import 'package:eventix/src/features/home/presentation/bloc/home.bloc.dart';

void initHome() {
  //datasource
  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(client: sl<EventixClient>()),
  );

  //repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(dataSource: sl<HomeDataSource>()),
  );

  //usecase
  sl.registerLazySingleton<BuscarEventosUseCase>(
    () => BuscarEventosUseCase(homeRepository: sl<HomeRepository>()),
  );

  //bloc
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(buscarEventosUseCase: sl<BuscarEventosUseCase>()),
  );
}
