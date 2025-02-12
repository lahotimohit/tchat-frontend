import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/call/app_bar.dart';
import 'package:tchat_frontend/src/widgets/call/bottom_bar.dart';

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
          CallAppBar(username: widget.username),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(widget.userPhoto),
          ),
          const CallBottomBar()
        ],
      )),
    );
  }
}