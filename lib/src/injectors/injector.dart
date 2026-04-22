import 'package:eventix/main.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/injectors/injector.home.dart';
import 'package:eventix/src/injectors/injector.login.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> initDependencies() async {
  sl.registerLazySingleton<EventixClient>(() => EventixClient());
  sl.registerSingleton<Box>(Hive.box('auth'));
  initLogin();
  initHome();
}
