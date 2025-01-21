import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/api/otp.dart';
import 'package:tchat_frontend/authentication/screen/signup.dart';
import 'package:tchat_frontend/home/screen/dashboard.dart';
import 'package:tchat_frontend/services/storage.dart';

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

  void _onSubmitOTP() async {
    // String otp = _otpControllers.map((controller) => controller.text).join();
    // print('OTP entered: $otp');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const SignupScreen()));
    // SecureStorage storage = SecureStorage();
    // setState(() {
    //   isVerified = true;
    // });
    // showCupertinoDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );

    // try {
    //   OtpAPI api = OtpAPI();
    //   final Map<String, dynamic> result = await api.verifyOtp(otp);
    //   setState(() {
    //     isVerified = false;
    //   });
    //   Navigator.of(context).pop();

    //   if (result['code'] == 200) {
    //     String isRegistered = "";
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text(result['msg'])));
    //     await storage.readData("isRegistered").then((value) {
    //       isRegistered = value;
    //     });
    //     isRegistered == "true"
    //         ? Navigator.of(context).pushAndRemoveUntil(
    //             MaterialPageRoute(builder: (ctx) => const HomeMainScreen()),
    //             (Route<dynamic> route) => false)
    //         : Navigator.of(context).pushAndRemoveUntil(
    //             MaterialPageRoute(builder: (ctx) => const SignupScreen()),
    //             (Route<dynamic> route) => false);
    //   } else {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text(result['error'])));
    //   }
    // } catch (e) {
    //   setState(() {
    //     isVerified = false;
    //   });
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("An error occurred: $e")),
    //   );
    // }
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    Text(
                      'OTP Verification',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enter the verification code we just sent on your email address',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
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
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
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
                    ElevatedButton(
                      onPressed: () {
                        _onSubmitOTP();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't Receive Code? ",
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add your resend logic here
                            debugPrint('Resend code requested');
                          },
                          child: const Text(
                            'Resend',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
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
    );
  }
}
