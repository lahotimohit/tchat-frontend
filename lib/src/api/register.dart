import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tchat_frontend/generated_api/client_index.dart';
import 'package:tchat_frontend/generated_api/tchat.models.swagger.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';

Future<bool> onRegister(BuildContext context, String name, String about) async {
  SecureStorage storage = SecureStorage();
  try {
    String accessToken ="";
    String refreshToken ="";
    await dotenv.load(fileName: '.env');
    await storage.readData("accessToken").then((value) {
        accessToken = value;
      });
    await storage.readData("refreshToken").then((value) {
        refreshToken = value;
      });
    late Tchat tchatClient = Tchat.create(baseUrl: Uri.parse(dotenv.env['SERVER_URL']!));
    final registerDto = RegisterDto(name: name, about: about);
    final response = await tchatClient.authRegisterPost(body: registerDto, authorization: "Bearer $accessToken", refresh: refreshToken);
    if(response.isSuccessful) {
      final newAccessToken = response.body["tokens"]["accessToken"];
      final newRefreshToken = response.body["tokens"]["accessToken"];
      storage.writeSecureData("accessToken", newAccessToken);
      storage.writeSecureData("refreshToken", newRefreshToken);
      return true;
    }
    else{
      final errorResponse = json.decode(response.error.toString());
      context.mounted? snackmessage(context, errorResponse['message']) : null;
      return false;
    }
  } catch (e) {
    context.mounted ? snackmessage(context, "Error $e"): null;
    return false;
  }
}
