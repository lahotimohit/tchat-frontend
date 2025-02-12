import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/src/providers/chat_providers.dart';
import 'package:tchat_frontend/src/models/chat.dart';
import 'package:tchat_frontend/src/screens/video_call_outgoing.dart';
import 'package:tchat_frontend/src/screens/voice_call_outgoing.dart';
import 'package:tchat_frontend/src/widgets/message_input.dart';
import 'package:tchat_frontend/src/widgets/messages.dart';
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
      date:  "Today",
      content: message,
      messageType: messageType,
      isSent: true,
      timestamp: "15:31",
      isRead: false,
      status: MessageStatus.sent,
    );

    // channel.sink.add(jsonEncode(newMessage.toJson()));

    setState(() {
    messages.insert(0, newMessage);
  });

    WidgetsBinding.instance.addPostFrameCallback((_) {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
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
    InkWell(
      child: SvgPicture.asset("assets/svgs/phone_rounded.svg"),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => 
        CallVoiceOutgoingScreen(username: widget.username, userPhoto: widget.profileImage,
        )));
      }),
    const SizedBox(width: 10),
    InkWell(
      child: SvgPicture.asset("assets/svgs/video_camera.svg"),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => VideoCallOutgoingScreen(username:  widget.username,)));
      },),
    const SizedBox(width: 10),
    SvgPicture.asset("assets/svgs/menu_dots.svg"),
    const SizedBox(width: 20),
  ],),
      body: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245)
                    ),
                    child: ListView.builder(
                          controller: _scrollController,
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            final bool showDateHeader = index == 0 || messages[index - 1].date != message.date;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (showDateHeader) 
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        message.date,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                buildMessage(message, context),
                              ],
                            );
                          },
                        ),
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