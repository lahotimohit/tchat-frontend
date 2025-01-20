import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/authentication/screen/login.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Image.asset(
  //             "assets/images/logo.png",
  //             width: 200,
  //             height: 200,
  //           ),
  //           const SizedBox(
  //             height: 35,
  //           ),
  //           Text(
  //             "Welcome to TChat",
  //             style: GoogleFonts.poppins(
  //                 color: Theme.of(context).colorScheme.primary,
  //                 fontSize: 32,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           const Text(
  //             "Stay in touch with your best friends.",
  //             style: TextStyle(fontSize: 16),
  //           ),
  //           const SizedBox(
  //             height: 40,
  //           ),
  //           SizedBox(
  //             width: 150,
  //             child: ElevatedButton(
  //               onPressed: () {
  //                 Navigator.of(context).push(
  //                     MaterialPageRoute(builder: (ctx) => const LoginScreen()));
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 padding: const EdgeInsets.all(1),
  //                 backgroundColor: Theme.of(context).colorScheme.primary,
  //                 foregroundColor: Colors.white,
  //               ),
  //               child: Text(
  //                 "Dive In",
  //                 style: GoogleFonts.raleway(
  //                     fontWeight: FontWeight.w700, fontSize: 16),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
                    child: Image.asset(
                      "assets/images/auth_screen/1.png",
                      fit: BoxFit.cover,
                    )),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const LoginScreen()));
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black, width: 1.5),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
