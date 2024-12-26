import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
  bool _isTimerComplete = false;
  bool isVerified = false;
  int _remainingSeconds = 300;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _onSubmitOTP() async {
    String otp = _otpControllers.map((controller) => controller.text).join();
    SecureStorage storage = SecureStorage();
    setState(() {
      isVerified = true;
    });
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      OtpAPI api = OtpAPI();
      final Map<String, dynamic> result = await api.verifyOtp(otp);
      setState(() {
        isVerified = false;
      });
      Navigator.of(context).pop();

      if (result['code'] == 200) {
        String isRegistered = "";
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result['msg'])));
        await storage.readData("isRegistered").then((value) {
          isRegistered = value;
        });
        isRegistered == "true"
            ? Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (ctx) => const HomeMainScreen()),
                (Route<dynamic> route) => false)
            : Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (ctx) => const SignupScreen()),
                (Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result['error'])));
      }
    } catch (e) {
      setState(() {
        isVerified = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _isTimerComplete = true;
          _timer.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  bool _isOtpComplete() {
    return _otpControllers.every((controller) => controller.text.isNotEmpty);
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Lottie.asset("assets/lottie/votp.json",
                      width: 250, height: 250, repeat: false),
                  Text(
                    'Verify your Email',
                    style: GoogleFonts.raleway(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Enter your OTP code here.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          controller: _otpControllers[index],
                          focusNode: _focusNodes[index],
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).colorScheme.primary),
                          decoration: InputDecoration(
                            counterText: '',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index + 1]);
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Time Remaining: ${_formatTime(_remainingSeconds)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: _remainingSeconds <= 60
                          ? const Color.fromARGB(255, 255, 131, 123)
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                _isTimerComplete
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.grey)),
                        onPressed: _isTimerComplete
                            ? () {
                                _remainingSeconds = 300;
                                _isTimerComplete = false;
                                _startTimer();
                              }
                            : null,
                        child: const Text(
                          'Resend OTP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _isOtpComplete()
                            ? () {
                                _onSubmitOTP();
                              }
                            : null,
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                Theme.of(context).colorScheme.primary)),
                        child: const Text(
                          'Verify OTP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
