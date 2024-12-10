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

  final String _loginURL = "https://api.escuelajs.co/api/v1/auth/login";
  final String _profileURL = "https://api.escuelajs.co/api/v1/auth/profile";

  Future<void> _saveToken(Map<String, dynamic> data) async {
    final accessToken = data['access_token'];
    final refreshToken = data['refresh_token'];
    await storage.writeSecureData("access_token", accessToken);
    await storage.writeSecureData("refresh_token", refreshToken);
  }

  Future<void> getProfile() async {
    await _dio.get(_profileURL);
  }

  Future<Map<String, dynamic>> dioLogin(String email, String password) async {
    final Map<String, dynamic> loginData = {
      "email": email,
      "password": password,
    };

    try {
      final response = await _dio.post(_loginURL, data: loginData);
      if (response.statusCode == 201) {
        await _saveToken(response.data);
        return {"msg": "Login Successfully...", "code": 201};
      }
      return {"error": "Unexpected error arises...", "code": 401};
    } on DioException catch (e) {
      return {"error": e, "code": 401};
    }
  }
}
