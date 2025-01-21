import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/authentication/screen/slide_up.dart';
import 'package:tchat_frontend/authentication/screen/login.dart';

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
                Container(
                  width: double.infinity,
                  child: Hero(
                    // Add Hero widget for smooth image transition
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TChat",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "space",
                      style: GoogleFonts.poppins(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Use custom route instead of MaterialPageRoute
                      Navigator.of(context).push(
                        SlideUpRoute(page: const LoginScreen()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // ... rest of the widgets ...
              ],
            ),
          ),
        ],
      ),
    );
  }
}
