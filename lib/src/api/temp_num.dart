import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tchat_frontend/generated_api/authentication/client_index.dart';
import 'package:tchat_frontend/generated_api/authentication/tchat.models.swagger.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';

Future<List> generateTempNum(BuildContext context) async {
  SecureStorage storage = SecureStorage();
  await dotenv.load(fileName: '.env');
  late Tchat tchatClient = Tchat.create(baseUrl: Uri.parse(dotenv.env['SERVER_URL']!));
  try {
    String accessToken="";
    await storage.readData("accessToken").then((value) {
        accessToken = "Bearer $value";
      });
    final mintResponse = await tchatClient.tnumMintPost(authorization: accessToken);
    if(mintResponse.isSuccessful || mintResponse.statusCode == 403) {
    final response = await tchatClient.tnumListPost(authorization: accessToken);
    if(response.isSuccessful) {
      return response.body['tnums'];
    }}
    return [];
    }
    on SocketException {
    context.mounted? snackmessage(context, "No internet connection") : null;
    return [];
    }
    catch (e) {
    context.mounted? snackmessage(context, "An error occurred: $e") : null;
    return [];
  }
}


Future<bool> submitTempNum(BuildContext context, String tempNumId) async {
  SecureStorage storage = SecureStorage();
  await dotenv.load(fileName: '.env');
  late Tchat tchatClient = Tchat.create(baseUrl: Uri.parse(dotenv.env['SERVER_URL']!));
  try {
    String accessToken="";
    await storage.readData("accessToken").then((value) {
        accessToken = "Bearer $value";
      });
      final activateDto = ActivateDto(temporaryNumberId: tempNumId);
      final response = await tchatClient.tnumActivatePost(body: activateDto, authorization: accessToken);
    if(response.isSuccessful) {
      storage.deleteData("isRegister");
      storage.writeSecureData("isLoggedIn", "true");
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