import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  Future onError(DioError err) {
    return super.onError(err);
  }
}
