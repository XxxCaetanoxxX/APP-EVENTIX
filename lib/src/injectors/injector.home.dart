import 'package:eventix/main.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/features/home/data/datasource/home_data_source.dart';

void initHome() {
  //data source
  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(client: sl<EventixClient>()),
  );
}
