import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final responseData = err.response?.data;
    final message = responseData is Map<String, dynamic>
        ? responseData['message']?.toString()
        : null;

    handler.next(
      err.copyWith(
        message: message ?? err.message ?? 'Unexpected network error',
      ),
    );
  }
}
