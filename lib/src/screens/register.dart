import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tchat_frontend/src/api/register.dart';
import 'package:tchat_frontend/src/common.dart';

import 'dart:io';
import 'package:tchat_frontend/src/widgets/bottom_sheet.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
import 'package:tchat_frontend/src/widgets/profile_photo.dart';
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

  void _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image;
    });
    Navigator.of(context).pop();
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
    await onRegister(context, name, about);
    Navigator.of(context).pop();
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (ctx) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: white,
              )),
          title: const CustomText(
            text: "Profile",
            color: white,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                child: ProfilePhoto(
                  image: _image != null ? File(_image!.path) : null,
                  onPressed: () => _openBottomSheet(context),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Card(
                    color: white,
                    elevation: 0,
                    child: Column(
                      children: [
                        cardItem(
                            const Icon(
                              Icons.person,
                              color: grey,
                            ),
                            "Name",
                            _nameController,
                            "Enter your name"),
                        const SizedBox(height: 16),
                        cardItem(const Icon(Icons.info, color: grey), "About",
                            _aboutController, "Hey there I'm using TChat"),
                        const SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            width: 250,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_aboutController.text.isEmpty ||
                                    _nameController.text.isEmpty) {
                                  snackmessage(
                                      context, "Please enter all details");
                                  return;
                                }
                                _submitSignup();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor:
                                    Theme.of(context).colorScheme.surface,
                              ),
                              child: const Text("Register"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
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

Widget cardItem(Icon labelIcon, String labelTitle,
    TextEditingController controller, String hintText) {
  return Column(
    children: [
      Row(
        children: [
          labelIcon,
          const SizedBox(
            width: 5,
          ),
          CustomText(
            text: labelTitle,
            color: grey,
          )
        ],
      ),
      const SizedBox(height: 4),
      Card(
        color: white,
        elevation: 0,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.raleway(
                  color: grey, fontWeight: FontWeight.w400)),
        ),
      ),
    ],
  );
}
