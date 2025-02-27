import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tchat_frontend/generated_api/authentication/client_index.dart';
import 'package:tchat_frontend/generated_api/authentication/tchat.models.swagger.dart';
import 'package:tchat_frontend/src/animations/fade_pageroute.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/screens/dashboard.dart';
import 'package:tchat_frontend/src/screens/register.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';

Future<bool> onVerifyOTP(BuildContext context, String otp) async {
  SecureStorage storage = SecureStorage();
  await dotenv.load(fileName: '.env');
  late Tchat tchatClient = Tchat.create(baseUrl: Uri.parse(dotenv.env['SERVER_URL']!));
  try {
    String otpToken="";
    await storage.readData("otpToken").then((value) {
        otpToken = value;
      });
    final otpDto = VerifyOtpDto(otp: otp);
    final response = await tchatClient.authVerifyOtpPost(otpToken: otpToken, body: otpDto);
    context.mounted? Navigator.of(context).pop(): null;
    if(response.isSuccessful) {
      final String accessToken = response.body['tokens']['accessToken'];
      final sessionResponse = await tchatClient.authSessionGet(authorization: "Bearer $accessToken");
      if(sessionResponse.isSuccessful) {
        final bool isRegistered = sessionResponse.body['session']['isRegistered'];
        if(!isRegistered) {
          context.mounted? Navigator.of(context).pushReplacement(fadeRoute(const SignupScreen())): null;
        }
        else {
          context.mounted? Navigator.of(context).pushReplacement(fadeRoute(const HomeMainScreen())): null;
        }
        storage.writeSecureData("accessToken", accessToken);
        storage.writeSecureData("refreshToken", response.body['tokens']['refreshToken']);
        storage.deleteData("otpToken");
      }
      return true;
    }
    else {
      final jsonError = json.decode(response.error.toString());
      context.mounted? snackmessage(context, jsonError['message']) : null;
      return false;
    }
  } catch (e) {
    context.mounted? snackmessage(context, "An error occurred: $e") : null;
    return false;
  }
}
