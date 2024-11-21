import 'package:flutter/material.dart';
import 'package:tchat_frontend/chats/widgets/message_input.dart';
import 'package:tchat_frontend/chats/widgets/messages.dart';
import 'package:tchat_frontend/chats/data/chat.dart';
import 'package:tchat_frontend/chats/widgets/appbar.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({super.key, required this.username, required this.profileImage, required this.status});
  final String username;
  final String profileImage;
  final String status; 

  @override
  State<ChatMainScreen> createState() {
    return _ChatMainScreen();
}
}

class _ChatMainScreen extends State<ChatMainScreen> {
  final ScrollController _scrollController = ScrollController();
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

    void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(username, status, profilephoto, context),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildMessage(messages[index], context);
              },
            ),
          ),
          buildMessageInputField(context),
        ],
      ),);
  }
}