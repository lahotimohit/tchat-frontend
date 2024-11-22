import 'package:flutter/material.dart';
import 'package:tchat_frontend/voice_call/widgets/outgoing_call.dart';
import 'package:tchat_frontend/voice_call/widgets/incoming_call.dart';

class VoiceCallScreen extends StatefulWidget {
  final bool isIncoming;
  final String userName;
  final String userPhoto;

  VoiceCallScreen({
    required this.isIncoming,
    required this.userName,
    required this.userPhoto,
  });

  @override
  _VoiceCallScreenState createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.userPhoto.startsWith('http')
                    ? NetworkImage(widget.userPhoto) as ImageProvider
                    : AssetImage(widget.userPhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text(
                  widget.userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.isIncoming
                      ? 'Incoming Voice Call'
                      : 'Outgoing Voice Call',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          widget.isIncoming
              ? Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: buildIncomingCallButtons(context),
                )
              : Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: buildOutgoingCallButtons(),
                ),
        ],
      ),
    );
  }
}
