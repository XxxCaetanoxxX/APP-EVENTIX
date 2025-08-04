import 'package:dio/dio.dart';
import 'package:eventix/main.dart';
import 'package:eventix/src/injectors/injector.login.dart';

Future<void> init() async {
  sl.registerLazySingleton<Dio>(()=>Dio());
  initLogin();
}