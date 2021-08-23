import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/app_setup/dio/request_interceptors.dart';
import 'package:riverpod_example/app_setup/dio/response_interceptors.dart';

import 'error_interceptors.dart';

final baseUrlProvider =
    Provider<String>((ref) => 'http://jsonplaceholder.typicode.com/');

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final baseUrl = ref.watch(baseUrlProvider);
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;
  dio.options.contentType = Headers.jsonContentType;
  dio.options.extra = <String, Object>{};
  dio.interceptors.addAll([
    LogInterceptor(),
    RequestInterceptor(),
    ResponseInterceptor(),
    ErrorInterceptor(),
  ]);
  return dio;
});
