import 'package:dio/dio.dart';
import 'package:tchat_frontend/services/storage.dart';

class DioInterceptor extends Interceptor {
  final Dio _dio = Dio();
  final refreshUrl = "https://api.escuelajs.co/api/v1/auth/refresh-token";
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SecureStorage storage = SecureStorage();
    final token = await storage.readData("access_token");

    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    options.headers["Content-Type"] = "application/json";
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final response = err.response;
      if (response != null && response.data != null) {
        if (response.data['error'] == 'Invalid credentials') {
          handler.reject(err);
          return;
        }
      }
      try {
        SecureStorage storage = SecureStorage();
        final refreshToken = await storage.readData("refresh_token");
        if (refreshToken.isNotEmpty) {
          final response = await _dio
              .post(refreshUrl, data: {"refresh_token": refreshToken});
          if (response.statusCode == 200) {
            final accessToken = response.data['access_token'];
            await storage.writeSecureData("access_token", accessToken);
            final options = err.requestOptions;
            options.headers["Authorization"] = "Bearer $accessToken";
            final retryResponse = await _dio.fetch(options);
            return handler.resolve(retryResponse);
          }
        }
      } catch (e) {
        handler.reject(err);
        return;
      }
    }
    super.onError(err, handler);
  }
}
