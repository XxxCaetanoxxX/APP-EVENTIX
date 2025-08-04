import 'package:eventix/main.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/injectors/injector.login.dart';

Future<void> init() async {
  sl.registerLazySingleton<EventixClient>(()=>EventixClient());
  initLogin();
}