import 'package:dio/dio.dart';
import 'package:tchat_frontend/interceptors/dio_interceptor.dart';
import 'package:tchat_frontend/services/storage.dart';

class LoginAPI {
  late Dio _dio;
  SecureStorage storage = SecureStorage();

  LoginAPI() {
    _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
  }

  final String _loginURL = "http://113.193.84.5:5003/api/v1/auth/login";

  Future<Map<String, dynamic>> dioLogin(String email) async {
    // TODO: Handle the case when server is off....
    try {
      final response = await _dio.post(_loginURL, data: {
        "email": email,
      });
      if (response.statusCode == 200) {
        storage.writeSecureData("email", email);
        String message = response.data['message'];
        return {"msg": message, "code": 200};
      }
      return {"error": "Unexpected error arises...", "code": 401};
    } on DioException catch (e) {
      return {"error": e, "code": 401};
    }
  }
}
