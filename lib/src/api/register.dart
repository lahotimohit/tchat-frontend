import 'package:flutter/material.dart';
import 'package:tchat_frontend/api/register.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';
import 'package:tchat_frontend/src/screens/dashboard.dart';

Future<bool> onRegister(BuildContext context, String name, String about) async {
  try {
    RegisterAPI api = RegisterAPI();
    final Map<String, dynamic> result =
        await api.dioRegister("https://placehold.co/600x400", about, name);

    if (result['code'] == 401) {
      snackmessage(context, result['error']);
      return false;
    } else {
      snackmessage(context, result['msg']);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const HomeMainScreen()));
      return true;
    }
  } catch (e) {
    snackmessage(context, "Internal Server Error");
    return false;
  }
}
