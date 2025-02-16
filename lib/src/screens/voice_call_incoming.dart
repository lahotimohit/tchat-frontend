import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

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
                CustomText(text: widget.isVideo? "Incoming Video Call" : "Incoming Voice Call", color: white, weight: FontWeight.w500, alignment: Alignment.center,),
                CustomText(text: widget.username, size: 32, color: white, alignment: Alignment.center,)
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