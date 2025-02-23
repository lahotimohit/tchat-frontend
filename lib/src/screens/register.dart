import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tchat_frontend/src/animations/fade_pageroute.dart';
import 'package:flutter/cupertino.dart';
import 'package:tchat_frontend/src/api/register.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/screens/start.dart';
import 'dart:io';
import 'package:tchat_frontend/src/widgets/bottom_sheet.dart';
import 'package:tchat_frontend/src/widgets/custom_elevated_button.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  XFile? _image;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

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

  void _checkPermission(BuildContext context, ImageSource source) async {
    FocusScope.of(context).requestFocus(FocusNode());
    Map<Permission, PermissionStatus> statues = await [
      Permission.camera,
    ].request();
    PermissionStatus? statusCamera = statues[Permission.camera];
    bool isGranted = statusCamera == PermissionStatus.granted;
    if (isGranted) {
      final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image;
    });
    context.mounted? Navigator.of(context).pop() : null;
    }
    bool isPermanentlyDenied =
        statusCamera == PermissionStatus.permanentlyDenied;
    if (isPermanentlyDenied) {
      const SnackBar(content: Text("Permission denied! Enable it in settings."));
    }
  }

  void _pickImage(ImageSource source) async {
    _checkPermission(context, source);
  }


  @override
  void dispose() {
    super.dispose();
  }

  void _submitSignup() async {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    String name = _nameController.text.trim();
    String about = _aboutController.text.trim();
    if(name.isEmpty || about.isEmpty) {
      context.mounted ? snackmessage(context, "Please enter both name and about...."): null;
      Navigator.of(context).pop();
      return;
    }
    final bool response = await onRegister(context, name, about);
    Navigator.of(context).pop();
    if(response) {
      Navigator.of(context).pushAndRemoveUntil(fadeRoute(const StartScreen(nextScreen: "Home")), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomText(
                            text: "Profile Info",
                            alignment: Alignment.center,
                            size: 24,
                            weight: FontWeight.w600,
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text:
                                "Please provide your name and about you and an optional profile photo",
                            size: 15,
                            color: grey,
                            weight: FontWeight.w500,
                            align: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => _openBottomSheet(context),
                            child: _image == null
                                ? SvgPicture.asset('assets/svgs/profile.svg')
                                : CircleAvatar(
                                    maxRadius: 75,
                                    backgroundImage: _image != null
                                        ? FileImage(File(_image!.path))
                                        : null,
                                  ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Enter your Name",
                              hintStyle: customTextStyle(14, grey, FontWeight.w500)
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _aboutController,
                            decoration: InputDecoration(
                              hintText: "About",
                              hintStyle: customTextStyle(14, grey, FontWeight.w500)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitSignup,
                    style: customElevatedButton(),
                    child: const CustomText(
                      alignment: Alignment.center,
                      text: "Continue",
                      color: white,
                    ),
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
