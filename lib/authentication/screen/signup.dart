import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tchat_frontend/authentication/widgets/bottom_sheet.dart';
import 'package:tchat_frontend/authentication/widgets/profile_photo.dart';
import 'package:tchat_frontend/authentication/widgets/text_field.dart';
import 'package:tchat_frontend/otp/screen/main.dart';

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
              TextFieldWidget(controller: _emailController, labelText: "Email Address", obscureText: false),
              const SizedBox(height: 20),
              TextFieldWidget(controller: _passwordController, labelText: "Password", obscureText: true),
              const SizedBox(height: 20),
              TextFieldWidget(controller: _confPasswordController, labelText: "Confirm Password", obscureText: true),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => OtpScreen()));
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
