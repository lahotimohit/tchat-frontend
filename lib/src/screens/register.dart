import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tchat_frontend/src/animations/fade_pageroute.dart';
import 'package:flutter/cupertino.dart';
import 'package:tchat_frontend/src/api/pp_upload.dart';
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
  bool _isUploading = false; // <-- Added state for tracking upload progress

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

  Future<void> _pickImage(ImageSource source) async {
    FocusScope.of(context).requestFocus(FocusNode());
    bool uploadSuccess = false;
    Map<Permission, PermissionStatus> statuses = await [Permission.camera].request();
    PermissionStatus? statusCamera = statuses[Permission.camera];
    if (statusCamera == PermissionStatus.granted) {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          Navigator.of(context).pop();
          _isUploading = true;
        });
        if(mounted){
        uploadSuccess = await uploadProfilePicture(context, image);
        }
        if (uploadSuccess) {
          setState(() {
            _image = image;
            _isUploading = false;
          });
        } else {
          setState(() {
            _isUploading = false;
          });
        }
      }
    } else if (statusCamera == PermissionStatus.permanentlyDenied && mounted) {
      snackmessage(context, "Permission denied! Enable it in settings.");
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _aboutController.dispose();
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

    if (name.isEmpty || about.isEmpty) {
      if (context.mounted) {
        snackmessage(context, "Please enter both name and about.");
      }
      Navigator.of(context).pop();
      return;
    }

    final bool response = await onRegister(context, name, about);
    if(mounted) Navigator.of(context).pop();

    if (response && mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        fadeRoute(const StartScreen(nextScreen: "Home")),
        (route) => false,
      );
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
                          const SizedBox(height: 30),
                          const CustomText(
                            text: "Profile Info",
                            alignment: Alignment.center,
                            size: 24,
                            weight: FontWeight.w600,
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text:
                                "Please provide your name, about you, and an optional profile photo.",
                            size: 15,
                            color: grey,
                            weight: FontWeight.w500,
                            align: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          
                          GestureDetector(
                            onTap: () => _openBottomSheet(context),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Show CircularProgressIndicator if uploading
                                if (_isUploading)
                                  const CircleAvatar(
                                    maxRadius: 75,
                                    backgroundColor: Colors.grey,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                else if (_image != null)
                                  CircleAvatar(
                                    maxRadius: 75,
                                    backgroundImage: FileImage(File(_image!.path)),
                                  )
                                else
                                  SvgPicture.asset('assets/svgs/profile.svg'),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Enter your Name",
                              hintStyle: customTextStyle(14, grey, FontWeight.w500),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _aboutController,
                            decoration: InputDecoration(
                              hintText: "About",
                              hintStyle: customTextStyle(14, grey, FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
