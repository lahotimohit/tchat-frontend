import 'package:dio/dio.dart';
import 'package:tchat_frontend/src/interceptors/dio_interceptor.dart';
import 'package:tchat_frontend/src/providers/storage.dart';

class OtpAPI {
  late Dio _dio;
  SecureStorage storage = SecureStorage();
  final String otpVerifyURL = "http://113.193.84.5:5003/api/v1/auth/verify-otp";
  final String sessionGetURL =
      "http://113.193.84.5:5003/api/v1/auth/get-session";
  String email = "";

  OtpAPI() {
    _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
  }

  Future<void> _saveToken(Map<String, dynamic> data) async {
    final accessToken = data['tokens']['accessToken'];
    final refreshToken = data['tokens']['refreshToken'];
    await storage.writeSecureData("access_token", accessToken);
    await storage.writeSecureData("refresh_token", refreshToken);
  }

  Future<bool> _getSession() async {
    try {
      final response = await _dio.get(sessionGetURL);
      final data = response.data;
      if (response.statusCode == 200) {
        bool isRegistered = data['isRegistered'];
        await storage.writeSecureData("isRegistered", isRegistered.toString());
        String credentials = data.toString();
        await storage.writeSecureData("credentials", credentials);
        return true;
      } else {
        throw Error();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String userOTP) async {
    try {
      await storage.readData("email").then((value) {
        email = value;
      });
      final Map<String, dynamic> data = {"email": email, "otp": userOTP};

      try {
        final response = await _dio.post(otpVerifyURL, data: data);
        if (response.statusCode == 200) {
          _saveToken(response.data);
          _getSession();
          storage.deleteData("email");
          String message = response.data['message'];
          return {"msg": message, "code": 200};
        }
      } on DioException catch (dioError) {
        if (dioError.response?.statusCode == 401) {
          return {
            "error": dioError.response?.data['message'] ?? "Invalid OTP",
            "code": 401
          };
        }
        return {
          "error": dioError.message ?? "An unexpected error occurred",
          "code": dioError.response?.statusCode ?? 500
        };
      }

      return {"error": "Unexpected error occurred", "code": 401};
    } catch (e) {
      return {"error": e.toString(), "code": 401};
    }
  }
}
