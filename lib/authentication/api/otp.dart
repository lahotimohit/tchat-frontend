import 'package:dio/dio.dart';
import 'package:tchat_frontend/interceptors/dio_interceptor.dart';
import 'package:tchat_frontend/services/storage.dart';

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
      if (response.statusCode == 200) {
        bool isRegistered = response.data['isRegistered'];
        await storage.writeSecureData("isRegistered", isRegistered.toString());
        String credentials = response.data.toString();
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
      // Read email from storage
      await storage.readData("email").then((value) {
        email = value;
      });

      // Prepare request data
      final Map<String, dynamic> data = {"email": email, "otp": userOTP};

      try {
        // Make the API call
        final response = await _dio.post(otpVerifyURL, data: data);

        // Successful response
        if (response.statusCode == 200) {
          _saveToken(response.data);
          _getSession();
          storage.deleteData("email");
          String message = response.data['message'];
          return {"msg": message, "code": 200};
        }
      } on DioException catch (dioError) {
        // Specifically handle Dio errors
        print(
            "Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr:${dioError.response!.statusCode}");
        if (dioError.response?.statusCode == 401) {
          return {
            "error": dioError.response?.data['message'] ?? "Invalid OTP",
            "code": 401
          };
        }

        // For other Dio errors
        return {
          "error": dioError.message ?? "An unexpected error occurred",
          "code": dioError.response?.statusCode ?? 500
        };
      }

      // Fallback error return
      return {"error": "Unexpected error occurred", "code": 401};
    } catch (e) {
      // Catch any other unexpected errors
      return {"error": e.toString(), "code": 401};
    }
  }
}
