import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tchat_frontend/generated_api/authentication/client_index.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'dart:convert';

Future<List> getTChatContacts(BuildContext context) async {
  SecureStorage storage = SecureStorage();
  await dotenv.load(fileName: '.env');
  late Tchat tchatClient = Tchat.create(baseUrl: Uri.parse(dotenv.env['SERVER_URL']!));

  try {
    String accessToken = "";
    await storage.readData("refreshToken").then((value) {
      accessToken = "Bearer $value";
    });
    print("Token: $accessToken");

    List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);

    List<Map<String, dynamic>> formattedContacts = contacts.map((contact) {
      String? phoneNumber = contact.phones.isNotEmpty ? contact.phones.first.number : null;

      if (phoneNumber != null) {
        phoneNumber = phoneNumber.replaceAll(" ", "").replaceAll("+91", ""); // Remove spaces and +91

        if (phoneNumber.length > 10) {
          phoneNumber = phoneNumber.substring(phoneNumber.length - 10); // Keep only last 10 digits
        }
      }

      return {
        "countryCode": 91,
        "mobileNumber": phoneNumber,
      };
    }).where((contact) => contact["mobileNumber"] != null).toList();

    Map<String, dynamic> requestBody = {"contacts": formattedContacts};

    final response = await tchatClient.contactsFilterPost(
      authorization: accessToken,
      body: jsonEncode(requestBody),
    );

    print(response);

    if (response.isSuccessful) {
      return response.body["contacts"] ?? [];
    } else {
      snackmessage(context, "Failed to fetch contacts: ${response.error}");
      return [];
    }
  } catch (e) {
    snackmessage(context, "Error: $e");
    return [];
  }
}
