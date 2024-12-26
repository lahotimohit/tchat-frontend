import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tchat_frontend/api/register.dart';
import 'package:tchat_frontend/authentication/widgets/snackmessage.dart';
import 'dart:io';
import 'package:tchat_frontend/authentication/widgets/bottom_sheet.dart';
import 'package:tchat_frontend/authentication/widgets/profile_photo.dart';
import 'package:tchat_frontend/home/screen/dashboard.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ImagePicker _picker = ImagePicker();
  bool isRegister = false;
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
    try {
      RegisterAPI api = RegisterAPI();
      final Map<String, dynamic> result = await api.dioRegister(
          "https://placehold.co/600x400",
          _aboutController.text.trim(),
          _nameController.text.trim());
      setState(() {
        isRegister = false;
      });
      Navigator.of(context).pop();

      if (result['code'] == 401) {
        snackmessage(context, result['error']);
      } else {
        snackmessage(context, result['msg']);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const HomeMainScreen()));
      }
    } catch (e) {
      setState(() {
        isRegister = false;
      });
      snackmessage(context, "Internal Server Error");
    }
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
              color: Colors.white,
            )),
        title: Text(
          "Profile",
          style: GoogleFonts.raleway(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
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
                    color: Colors.white,
                    elevation: 0,
                    child: Column(
                      children: [
                        cardItem(
                            const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            "Name",
                            _nameController,
                            "Enter your name"),
                        const SizedBox(height: 16),
                        cardItem(
                            const Icon(Icons.info, color: Colors.grey),
                            "About",
                            _aboutController,
                            "Hey there I'm using TChat"),
                        const SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            width: 250,
                            child: ElevatedButton(
                              onPressed: () {
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
          Text(labelTitle,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
      const SizedBox(height: 4),
      Card(
        color: Colors.white,
        elevation: 0,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.raleway(
                  color: Colors.grey, fontWeight: FontWeight.w400)),
        ),
      ),
    ],
  );
}
