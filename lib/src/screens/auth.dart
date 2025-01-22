import 'package:flutter/material.dart';
import 'package:tchat_frontend/authentication/screen/slide_up.dart';
import 'package:tchat_frontend/authentication/screen/login.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Hero(
                    tag: 'background_image',
                    child: Image.asset(
                      "assets/images/auth_screen/1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 80,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      size: 20,
                      text: "TChat",
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                      size: 20,
                      text: "space",
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: black,
                        foregroundColor: white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          SlideUpRoute(page: const LoginScreen()),
                        );
                      },
                      child: const CustomText(
                        size: 16,
                        text: "Login",
                        color: white,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
