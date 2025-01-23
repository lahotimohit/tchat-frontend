import 'package:flutter/material.dart';
import 'package:tchat_frontend/api/otp.dart';
import 'package:tchat_frontend/home/screen/dashboard.dart';
import 'package:tchat_frontend/services/storage.dart';
import 'package:tchat_frontend/src/screens/register.dart';

Future<bool> onVerifyOTP(BuildContext context, String otp) async {
  SecureStorage storage = SecureStorage();

  try {
    OtpAPI api = OtpAPI();
    final Map<String, dynamic> result = await api.verifyOtp(otp);

    if (result['code'] == 200) {
      String isRegistered = "";
      await storage.readData("isRegistered").then((value) {
        isRegistered = value;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result['msg'])));
      isRegistered == "true"
          ? Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (ctx) => const HomeMainScreen()),
              (Route<dynamic> route) => false)
          : Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (ctx) => const SignupScreen()),
              (Route<dynamic> route) => false);
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result['error'])));
      return false;
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("An error occurred: $e")),
    );
    return false;
  }
}
