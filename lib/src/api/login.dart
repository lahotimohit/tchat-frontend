import 'dart:convert';
import 'package:tchat_frontend/generated_api/client_index.dart';
import 'package:tchat_frontend/generated_api/tchat.models.swagger.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';
import 'package:tchat_frontend/src/validators/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<bool> onLogin(BuildContext context, String email, String phone, int code) async {
  AuthValidation auth = AuthValidation(email, phone);
  SecureStorage storage = SecureStorage();
  await dotenv.load(fileName: '.env');

  late Tchat tchatClient;
  tchatClient = Tchat.create(baseUrl: Uri.parse(dotenv.env["SERVER_URL"]!));

  final String validate= await auth.validation();
  context.mounted? Navigator.of(context).pop() : null;
  if (validate == "Success") {
    try {
      final loginDto = LoginDto(countryCode: code, email: email, defaultMobileNumber: phone);
      final response = await tchatClient.authLoginPost(body: loginDto);
      if(response.isSuccessful) {
        storage.writeSecureData("otpToken", response.body['otpToken']);
      return true;
      }
      else{
       Map<String, dynamic> jsonResponse = json.decode(response.error.toString());
       context.mounted ? snackmessage(context, jsonResponse['message']) : null;
       return false;
      }
    } 
    catch (e) {
      context.mounted? snackmessage(context, "Error: $e") : null;
      return false;
    }
  } else {
    context.mounted? snackmessage(context, validate) : null;
    return false;
  }
}
