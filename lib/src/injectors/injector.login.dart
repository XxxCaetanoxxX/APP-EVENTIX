import 'package:eventix/main.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/features/login/data/datasources/login.datasource.dart';
import 'package:eventix/src/features/login/data/repositories/login.repository_impl.dart';
import 'package:eventix/src/features/login/domain/repositories/login.repository.dart';
import 'package:eventix/src/features/login/domain/usecases/login.usecase.dart';
import 'package:eventix/src/features/login/presentation/bloc/login.bloc.dart';
import 'package:hive_flutter/adapters.dart';

/*
 * 1. O Contrato (<ClasseAbstrata>):
 * Dentro do sinal de menor/maior <>, colocamos a interface ou abstração (ex: LoginDataSource).
 * Dizemos ao injetor (sl): "Se alguém pedir um LoginDataSource, assuma essa responsabilidade".
 * 
 * 2. A Implementação ( () => ClasseImpl() ):
 * Logo depois, passamos a classe concreta que faz o trabalho (ex: LoginDataSourceImpl).
 * O injetor sabe que deve construir e devolver essa implementação quando o contrato for chamado.
 * 
 * 3. A Chamada ( sl<ClasseAbstrata>() ):
 * Quando referenciamos a dependência em outras classes (como no Repository pedindo o DataSource),
 * nós sempre pedimos pelo Contrato usando sl<LoginDataSource>(). A classe não sabe e não precisa
 * saber qual é a Impl recebida. Isso permite trocar a implementação futuramente mudando
 * apenas uma linha neste arquivo, sem quebrar o resto do app!
 */

void initLogin() {
  //data source
  sl.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(box: sl<Box>(), client: sl<EventixClient>()),
  );

  //repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(loginDataSource: sl<LoginDataSource>()),
  );

  //usecase
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(loginRepository: sl<LoginRepository>()),
  );

  //bloc
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(loginUseCase: sl<LoginUseCase>()),
  );
}
