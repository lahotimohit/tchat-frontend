import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/authentication/screen/login.dart';
import 'package:tchat_frontend/authentication/screen/signup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Welcome to TChat",
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Stay in touch with your best friends.",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const LoginScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const SignupScreen()));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
