import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchat_frontend/chats/models/chat.dart';
import 'package:tchat_frontend/chats/widgets/message_input.dart';
import 'package:tchat_frontend/chats/widgets/messages.dart';
import 'package:tchat_frontend/chats/data/chat.dart';
import 'package:tchat_frontend/chats/widgets/appbar.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({
    super.key,
    required this.username,
    required this.profileImage,
    required this.status,
  });

  final String username;
  final String profileImage;
  final String status;

  @override
  State<ChatMainScreen> createState() {
    return _ChatMainScreen();
  }
}

class _ChatMainScreen extends State<ChatMainScreen>
    with WidgetsBindingObserver {
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

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 62, 102, 197), // Primary color
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    if (bottomInset > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  void _onNewMessage(String message) {
    setState(() {
      messages.add(Message(
        senderId: "",
        receiverId: "",
        id: '12',
        content: message,
        isSent: true,
        timestamp: DateTime.now(),
        isRead: false,
      ));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(username, status, profilephoto, context),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildMessage(messages[index], context);
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
