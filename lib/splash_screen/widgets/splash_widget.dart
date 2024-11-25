import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchat_frontend/authentication/screen/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MainSplashWidget extends StatelessWidget {
  const MainSplashWidget({super.key, required this.i});
  final int i;

  @override
  Widget build(BuildContext context) {
    String title ="";
    String content ="";
    Widget? lottieAnimation;

    if(i==1) {
      title = "GET NOTIFIED";
      content = "Communicate with your friends in a fast, reliable and secure way.";
      lottieAnimation = Lottie.asset('assets/lottie/splash.json');
    }

    else if(i==2) {
      title = "GROUP CHATS";
      content = "Create group chats and stay in touch with your gang.";
      lottieAnimation = Lottie.asset('assets/lottie/group.json');
    }

    else {
      title = "COMMUNITY";
      content = "Come to TChat and become part of a growing community";
      lottieAnimation = Lottie.asset('assets/lottie/community.json');
    }

    return Column(
                  children: [
                    const SizedBox(height: 100),
                    ClipOval(
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: lottieAnimation
                    ),
                  ),
                    const SizedBox(height: 50),
                    Text(title,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Text(
                      content,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    if (i == 3) ...[
                      const SizedBox(height: 40),
                      OutlinedButton(
                        onPressed: () {
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.edgeToEdge);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const AuthScreen()));
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ]
                  ],
                );
  }
}