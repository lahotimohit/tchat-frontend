import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/chats/models/chat.dart';
import 'package:tchat_frontend/chats/widgets/message_input.dart';
import 'package:tchat_frontend/chats/widgets/messages.dart';
import 'package:tchat_frontend/chats/data/chat.dart';
import 'package:tchat_frontend/chats/widgets/appbar.dart';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

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

  late final WebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    username = widget.username;
    status = widget.status;
    profilephoto = widget.profileImage;

    channel = WebSocketChannel.connect(
      Uri.parse('ws://192.168.0.101:8000/ws/sc/'),
    );

    channel.stream.listen(
      (event) {
        try {
          final data = jsonDecode(event);
          final incomingMessage = Message.fromJson(data);
          setState(() {
            messages.add(incomingMessage);
          });
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent);
          });
        } catch (e) {
          debugPrint('Error parsing incoming message: $e');
        }
      },
      onError: (error) {
        debugPrint('WebSocket error: $error');
      },
      onDone: () {
        debugPrint('WebSocket closed');
      },
    );

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    channel.sink.close();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 62, 102, 197),
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
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: "",
      receiverId: "",
      content: message,
      isSent: true,
      timestamp: DateTime.now(),
      isRead: false,
      status: MessageStatus.sent,
    );

    channel.sink.add(jsonEncode(newMessage.toJson()));

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
      appBar: chatAppBar(username, status, profilephoto, context),
      body: messages.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Center(
                  child: Text(
                    "No Chats available",
                    style: GoogleFonts.raleway(fontWeight: FontWeight.w600),
                  ),
                ),
                buildMessageInputField(
                  onNewMessage: _onNewMessage,
                ),
              ],
            )
          : Column(
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
