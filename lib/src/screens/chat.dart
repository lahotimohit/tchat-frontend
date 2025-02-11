import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/chats/data/chat.dart';
import 'package:tchat_frontend/chats/models/chat.dart';
import 'package:tchat_frontend/chats/widgets/message_input.dart';
import 'package:tchat_frontend/chats/widgets/messages.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.username, required this.profileImage, required this.status});
  final String username;
  final String profileImage;
  final String status;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  void _onNewMessage(String message, MessageType messageType) {
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: "",
      receiverId: "",
      content: message,
      messageType: messageType,
      isSent: true,
      timestamp: DateTime.now(),
      isRead: false,
      status: MessageStatus.sent,
    );

    // channel.sink.add(jsonEncode(newMessage.toJson()));

    setState(() {
      messages.add(newMessage);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 86,
        leading: Row(
          children: [
            const SizedBox(width: 6),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 20, color: black),
              onPressed: () {},
            ),
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(widget.profileImage),
            ),
          ],
        ),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(text: widget.username, weight: FontWeight.w500),
    ],
  ),
  actions: [
    SvgPicture.asset("assets/svgs/phone_rounded.svg"),
    const SizedBox(width: 10),
    SvgPicture.asset("assets/svgs/video_camera.svg"),
    const SizedBox(width: 10),
    SvgPicture.asset("assets/svgs/menu_dots.svg"),
    const SizedBox(width: 20),
  ],),
      body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      if (message.messageType == MessageType.image) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 1.0,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(message.content),
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return buildMessage(message, context);
                    },
                  ),
                ),
                buildMessageInputField(
                  onNewMessage: _onNewMessage,
                ),
              ],
            ),
    );
  }
}