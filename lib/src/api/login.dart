import 'package:tchat_frontend/api/login.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tchat_frontend/authentication/widgets/snackmessage.dart';
import 'package:tchat_frontend/authentication/validators/auth.dart';
import 'package:flutter/material.dart';
import 'package:tchat_frontend/otp/screen/main.dart';

Future<bool> onLogin(
    BuildContext context, String email, String phone, String code) async {
  AuthValidation auth = AuthValidation(email, phone, code);
  final String response = auth.validation();

  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult[0] == ConnectivityResult.none) {
    snackmessage(context, "Please check your internet connection");
    return false;
  } else if (response == "Success") {
    try {
      LoginAPI api = LoginAPI();
      final Map<String, dynamic> result =
          await api.dioLogin(email, code, phone);
      Navigator.of(context).pop();

      if (result['code'] == 401) {
        snackmessage(context, result['error']);
        return false;
      } else {
        snackmessage(context, result['msg']);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const OtpScreen()));
        return true;
      }
    } catch (e) {
      snackmessage(context, "Internal Server Error");
      return false;
    }
  } else {
    snackmessage(context, response);
    return false;
  }
}
