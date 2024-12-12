import 'package:flutter/material.dart';

void snackmessage(BuildContext context, String message) {
  if (ScaffoldMessenger.maybeOf(context) != null) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 1),
        ),
      );
  }
}
