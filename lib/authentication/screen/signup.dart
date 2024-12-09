import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tchat_frontend/authentication/widgets/bottom_sheet.dart';
import 'package:tchat_frontend/authentication/widgets/profile_photo.dart';
import 'package:tchat_frontend/authentication/widgets/text_field.dart';
import 'package:tchat_frontend/otp/screen/main.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContent(
          onImageSelected: _pickImage,
        );
      },
    );
  }

  void _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image;
    });
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confPasswordController.dispose();
    super.dispose();
  }

  void _submitSignup() async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("All fields are necessary"),
        duration: Duration(seconds: 2),
      ));
    } else if (_passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password length must be atleast 6 digits"),
        duration: Duration(seconds: 2),
      ));
    } else if (_passwordController.text != _confPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password & Confirm Password not match"),
        duration: Duration(seconds: 2),
      ));
    } else if (!_emailController.text.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter valid email address"),
        duration: Duration(seconds: 2),
      ));
    } else {
      var url = Uri.http("192.168.14.23:8000", "/register");
      var response = await http.post(url,
          body: json.encode({
            "email": _emailController.text,
            "password": _passwordController.text
          }));
      if (response.statusCode == 200) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => OtpScreen()));
      } else {
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(json.decode(response.body).toString()),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create new account",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ProfilePhoto(
                  image: _image != null ? File(_image!.path) : null,
                  onPressed: () => _openBottomSheet(context),
                ),
              ),
              const SizedBox(height: 40),
              TextFieldWidget(
                  controller: _emailController,
                  labelText: "Email Address",
                  obscureText: false),
              const SizedBox(height: 20),
              TextFieldWidget(
                  controller: _passwordController,
                  labelText: "Password",
                  obscureText: true),
              const SizedBox(height: 20),
              TextFieldWidget(
                  controller: _confPasswordController,
                  labelText: "Confirm Password",
                  obscureText: true),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      _submitSignup();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    child: const Text("Sign Up"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
