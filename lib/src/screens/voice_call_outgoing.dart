import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class CallVoiceOutgoingScreen extends StatefulWidget {
  const CallVoiceOutgoingScreen({super.key, required this.username, required this.userPhoto});
  final String username;
  final String userPhoto;
  @override
  State<CallVoiceOutgoingScreen> createState() {
    return _CallVoiceOutgoingScreen();
}
}

class _CallVoiceOutgoingScreen extends State<CallVoiceOutgoingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.arrow_back_ios_new)),
                  Column(
                    children: [
                      CustomText(text: widget.username, weight: FontWeight.w600,),
                      const CustomText(text: "1:00:01", size: 14, color: grey, weight: FontWeight.w500,)
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svgs/user_add_call.svg"),
                      const SizedBox(width: 15,)
                    ],
                  ),
                ],
              ),
            ],
          ),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(widget.userPhoto),
          ),
          Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 245, 245, 245),
                height: MediaQuery.of(context).size.height * 0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/horizontal_dots.svg"),
                    const SizedBox(width: 9,),
                    SvgPicture.asset("assets/svgs/speaker.svg"),
                    const SizedBox(width: 9,),
                    SvgPicture.asset("assets/svgs/mic.svg"),
                    const SizedBox(width: 9,),
                    InkWell(
                      child: SvgPicture.asset("assets/svgs/endCall.svg"),
                      onTap: () {
                        Navigator.of(context).pop();
                      },),
                  ],
                ),
              ),
              const SizedBox(height: 5,)
            ],
          )
        ],
      )),
    );
  }
}