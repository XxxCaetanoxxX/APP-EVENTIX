import 'package:eventix/main.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/features/perfil/data/datasource/perfil.datasource.dart';
import 'package:eventix/src/features/perfil/data/repository/perfil.repository.impl.dart';
import 'package:eventix/src/features/perfil/domain/repository/perfil.repository.dart';
import 'package:eventix/src/features/perfil/domain/usecase/atualizar_perfil.usecase.dart';
import 'package:eventix/src/features/perfil/domain/usecase/recuperar_perfil.usecase.dart';
import 'package:eventix/src/features/perfil/presentation/bloc/perfil.bloc.dart';

void initPerfil() {
  //datasource
  sl.registerLazySingleton<PerfilDataSource>(
    () => PerfilDataSourceImpl(client: sl<EventixClient>()),
  );

  //repository
  sl.registerLazySingleton<PerfilRepository>(
    () => PerfilRepositoryImpl(dataSource: sl<PerfilDataSource>()),
  );

  //usecase
  sl.registerLazySingleton<BuscarPerfilUseCase>(
    () => BuscarPerfilUseCase(repository: sl<PerfilRepository>()),
  );
  sl.registerLazySingleton<AtualizarPerfilUseCase>(
    () => AtualizarPerfilUseCase(repository: sl<PerfilRepository>()),
  );

  //bloc
  sl.registerFactory<PerfilBloc>(
    () => PerfilBloc(
      buscarPerfilUseCase: sl<BuscarPerfilUseCase>(),
      atualizarPerfilUseCase: sl<AtualizarPerfilUseCase>(),
    ),
  );
}
