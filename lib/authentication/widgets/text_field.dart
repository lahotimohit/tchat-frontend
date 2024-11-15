import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.controller ,required this.labelText, required this.obscureText});
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: labelText,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              );
  }
}