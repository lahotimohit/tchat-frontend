import "package:flutter/material.dart";

Widget buildCircularButton({
  required IconData icon,
  required Color color,
  Color backgroundColor = Colors.black54,
  required VoidCallback onPressed,
}) {
  return FloatingActionButton(
    onPressed: onPressed,
    backgroundColor: backgroundColor,
    elevation: 5,
    shape: const CircleBorder(),
    child: Icon(
      icon,
      color: color,
      size: 28,
    ),
  );
}
