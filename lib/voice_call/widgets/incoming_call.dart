import "package:flutter/material.dart";
import "package:tchat_frontend/voice_call/widgets/circular_button.dart";

Widget buildIncomingCallButtons(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildCircularButton(
        icon: Icons.call_end,
        color: Colors.red,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      const SizedBox(width: 40),
      buildCircularButton(
        icon: Icons.call,
        color: Colors.green,
        onPressed: () {
        },
      ),
    ],
  );
}
