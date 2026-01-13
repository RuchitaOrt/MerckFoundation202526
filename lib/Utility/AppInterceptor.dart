import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add token if available
    final token = ""; // fetch from shared pref
    if (token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    print("➡️ ${options.method} ${options.uri}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("✅ ${response.statusCode} ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException e, ErrorInterceptorHandler handler) {
    print("❌ ${e.message}");
    super.onError(e, handler);
  }
}
