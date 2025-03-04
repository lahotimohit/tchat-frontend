import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tchat_frontend/generated_api/authentication/client_index.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';

Future<bool> getSession(BuildContext context) async {
  SecureStorage storage = SecureStorage();
  await dotenv.load(fileName: '.env');
  late Tchat tchatClient = Tchat.create(baseUrl: Uri.parse(dotenv.env['SERVER_URL']!));
  try {
    String refreshToken = "";
      await storage.readData("refreshToken").then((value) {
        refreshToken = "Bearer $value";
      });
      final response = await tchatClient.authSessionGet(authorization: refreshToken);
    if(response.isSuccessful) {
      storage.writeSecureData("session", jsonEncode(response.body['session']));
      return true;
    }
    else {
      context.mounted? snackmessage(context, "An error occurred: ${response.error}") : null;
      return false;
    }}
    on SocketException {
    context.mounted? snackmessage(context, "No internet connection") : null;
    return false;
    }
    catch (e) {
    context.mounted? snackmessage(context, "An error occurred: $e") : null;
    return false;
  }
}