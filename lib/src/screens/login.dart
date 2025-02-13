import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tchat_frontend/src/animations/fade_pageroute.dart';
import 'package:tchat_frontend/src/screens/otp.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_elevated_button.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:tchat_frontend/src/api/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  // late AnimationController _animationController;
  // late LoginScreenAnimations _animations;
  final TextEditingController _emailController = TextEditingController();
  bool isLogin = false;
  String _countryCode = "";
  String _mobile = "";

  @override
  void initState() {
    super.initState();
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 850),
    // );
    // _animations = LoginScreenAnimations(_animationController);
    // LoginScreenAnimations.initialize(_animationController);
  }

  @override
  void dispose() {
    // if (_animationController.status == AnimationStatus.forward ||
    //     _animationController.status == AnimationStatus.reverse) {
    //   _animationController.stop();
    // }
    // _animationController.dispose();
    super.dispose();
  }

  void _onLogin(BuildContext context) async {
    // showCupertinoDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    final String email = _emailController.text.trim();
    final String code = _countryCode;
    final String phone = _mobile;
    // await onLogin(context, email, phone, code);
    // Navigator.of(context).pop();
    print(email);
    print(code);
    print(phone);
    Navigator.of(context)
        .push(
          fadeRoute(const OtpScreen())
          // MaterialPageRoute(builder: (ctx) => const OtpScreen())
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset(
                        'assets/images/auth_screen/2.png',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                  Positioned(
                    top: 35,
                    left: 8,
                    child:  Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                              Navigator.of(context).pop();
                            }
                            ))
                          // },
                        ),]
                      ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomText(
                            size: 24,
                            text: "Welcome back!",
                            weight: FontWeight.w600,
                          // )
                          ),
                    const SizedBox(height: 10),
                    const CustomText(
                            size: 14,
                            text: "Glad to see you, Again!",
                            color: grey,
                          ),
                    const SizedBox(height: 32),
                    TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                    const SizedBox(height: 16),
                    IntlPhoneField(
                          decoration: InputDecoration(
                            hintText: 'Enter your mobile number',
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            _countryCode = phone.countryCode;
                            _mobile = phone.completeNumber;
                          },
                        ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                            onPressed: () {
                              _onLogin(context);
                            },
                            style: customElevatedButton(),
                            child: const CustomText(
                              alignment: Alignment.center,
                              size: 16,
                              text: "Login",
                              color: white,
                            )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
