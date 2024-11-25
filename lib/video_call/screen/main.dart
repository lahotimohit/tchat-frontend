import 'package:flutter/services.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "4c848382f9464ac08c62ce6c149291f5",
      channelName: "tchat-channel",
      tempToken: "007eJxTYJhwUnRzgmnNwYit1ya/SNpi45/pzvFG9yPnXfMNdv97j9krMJgkW5hYGFsYpVmamJkkJhtYJJsZJaeaJRuaWBpZGqaZ+uc6pzcEMjLUvlrBzMgAgSA+L0NJckZiiS6QyMtLzWFgAACdEiMa"
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void initAgora() async {
    await [
      Permission.camera,
      Permission.microphone,
      Permission.bluetooth,
    ].request();

    await client.initialize();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
              enableHostControls: true,
              showNumberOfUsers: true,
            ),
            AgoraVideoButtons(
              client: client,
              addScreenSharing: false,
            ),
          ],
        ),
      ),
    );
  }
}