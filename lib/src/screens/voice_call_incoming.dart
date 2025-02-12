import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/src/common.dart';

class CallVoiceIncomingScreen extends StatefulWidget {
  const CallVoiceIncomingScreen({super.key, required this.username, required this.userPhoto, required this.isVideo});
  final String username;
  final String userPhoto;
  final bool isVideo;
  @override
  State<CallVoiceIncomingScreen> createState() {
    return _CallVoiceIncomingScreen();
}
}

class _CallVoiceIncomingScreen extends State<CallVoiceIncomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.userPhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                 Text(widget.isVideo? "Incoming Video Call" : "Incoming Voice Call",
                  style: GoogleFonts.poppins(
                    color: white,
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.username,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: SvgPicture.asset("assets/svgs/endcall_big.svg"),
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                      const SizedBox(width: 45,),
                      SvgPicture.asset("assets/svgs/pickcall.svg"),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}