import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchat_frontend/src/animations/fade_pageroute.dart';
// import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:tchat_frontend/src/screens/register.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';
// import 'package:tchat_frontend/src/api/otp.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_elevated_button.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  @override
  State<OtpScreen> createState() {
    return _OtpVerificationScreenState();
  }
}

class _OtpVerificationScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  bool isVerified = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
  }

  void _onSubmitOTP(String otp) async {
    // showCupertinoDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    // print('OTP entered: $otp');
    // await onVerifyOTP(context, otp);
    // Navigator.of(context).pop();
    Navigator.of(context)
        .push(
          fadeRoute(const SignupScreen())
          );
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                          child: Container(
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
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomText(
                            text: "OTP Verification",
                            size: 24,
                            weight: FontWeight.w600,
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text:
                                "Enter the verification code we just sent on your email address",
                            size: 14,
                            color: grey,
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              4,
                              (index) => SizedBox(
                                width: 64,
                                child: TextField(
                                  controller: _otpControllers[index],
                                  focusNode: _focusNodes[index],
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 2),
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  onChanged: (value) {
                                    if (value.isNotEmpty && index < 3) {
                                      _focusNodes[index + 1].requestFocus();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                  text: "Didn't Receive Code?",
                                  size: 14,
                                  color: grey),
                              GestureDetector(
                                onTap: () {
                                  debugPrint('Resend code requested');
                                },
                                child: const CustomText(
                                  size: 14,
                                  color: blue,
                                  weight: FontWeight.w600,
                                  text: "Resend",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String otp = _otpControllers
                        .map((controller) => controller.text)
                        .join();
                    if (otp.length != 4) {
                      snackmessage(context, "Please enter valid otp");
                      return;
                    }
                    _onSubmitOTP(otp);
                  },
                  style: customElevatedButton(),
                  child: const CustomText(
                    alignment: Alignment.center,
                    text: "Verify",
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
