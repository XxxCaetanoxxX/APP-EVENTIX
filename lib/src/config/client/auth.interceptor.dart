import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async{
    final box = Hive.box('auth');
    final token = box.get('token');
    
    if(token != null){
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }
}