import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  Future onRequest (RequestOptions options){
    return super.onRequest(options);
  }
}