import 'package:dio/dio.dart';

import '../../constants/app_constants.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'appid': AppConstants.apiKey,
      'units': 'metric',
    });
    handler.next(options);
  }
}
