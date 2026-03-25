import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:eventix/src/config/client/auth.interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class EventixClient extends DioForNative {
  EventixClient()
    : super(
        BaseOptions(
          baseUrl: dotenv.env['BACKEND_URL']!,
          connectTimeout: const Duration(seconds: 35),
          receiveTimeout: const Duration(seconds: 35),
          headers: {'Content-type': 'application/json'},
        ),
      ) {
    interceptors.add(AuthInterceptor());

    interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: (obj) => print(obj),
      ),
    );
  }
}
