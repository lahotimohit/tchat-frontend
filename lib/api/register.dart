import 'package:dio/dio.dart';
import 'package:tchat_frontend/src/interceptors/dio_interceptor.dart';
import 'package:tchat_frontend/src/providers/storage.dart';

class RegisterAPI {
  late Dio _dio;
  SecureStorage storage = SecureStorage();

  RegisterAPI() {
    _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
  }

  final String _loginURL = "http://113.193.84.5:5003/api/v1/auth/register";

  Future<Map<String, dynamic>> dioRegister(
      String name, String about, String url) async {
    try {
      final response = await _dio.post(_loginURL,
          data: {"profilePicture": url, "about": about, "name": name});
      if (response.statusCode == 200) {
        String message = response.data['message'];
        return {"msg": message, "code": 200};
      }
      return {"error": "Unexpected error arises...", "code": 401};
    } on DioException catch (e) {
      return {"error": e, "code": 401};
    }
  }
}
