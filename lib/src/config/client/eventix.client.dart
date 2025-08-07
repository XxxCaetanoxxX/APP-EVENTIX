import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:eventix/src/config/client/auth.interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EventixClient extends DioForNative {
  EventixClient()
    : super(
        BaseOptions(
          baseUrl: dotenv.env['BACKEND_URL']!,
          connectTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
          headers: {
            'Content-type': 'application/json',
          }
        ),
      ){
        interceptors.add(AuthInterceptor());
      }
}
