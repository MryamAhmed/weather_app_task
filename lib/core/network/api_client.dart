import 'package:dio/dio.dart';

import '../constants/app_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

abstract class ApiClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(),
      ErrorInterceptor(),
      LoggingInterceptor(),
    ]);

    return dio;
  }
}
