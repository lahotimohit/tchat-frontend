import 'package:flutter/material.dart';
import 'package:tchat_frontend/chats/widgets/appbar.dart';

class ChatMainScreen extends StatefulWidget {
  ChatMainScreen({super.key, required this.username, required this.profileImage, required this.status});
  late String username;
  late String profileImage;
  late String status; 

  @override
  State<ChatMainScreen> createState() {
    return _ChatMainScreen();
}
}

class _ChatMainScreen extends State<ChatMainScreen> {
  late String username;
  late String status;
  late String profilephoto;

  @override
  void initState() {
    super.initState();
    username = widget.username;
    status = widget.status;
    profilephoto = widget.profileImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(username, status, profilephoto, context),
      body: Text(username));
  }
}