import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/common.dart';

ButtonStyle customElevatedButton() {
  return ElevatedButton.styleFrom(
    backgroundColor: black,
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
