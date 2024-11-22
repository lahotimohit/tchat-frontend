import "package:tchat_frontend/voice_call/widgets/circular_button.dart";
import "package:flutter/material.dart";

class buildOutgoingCallButtons extends StatefulWidget {

  @override
  State<buildOutgoingCallButtons> createState() => _buildOutgoingCallButtonsState();
}

class _buildOutgoingCallButtonsState extends State<buildOutgoingCallButtons> {
  bool micOff = true;
  bool speakerOff = true;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildCircularButton(
            icon: Icons.mic_off,
            color: micOff ? Colors.white : Colors.red,
            backgroundColor: micOff ? Colors.black54 : Colors.white,
            onPressed: () {
              setState(() {
              micOff = !micOff; 
            });
            },
          ),
          buildCircularButton(
            icon: Icons.volume_up,
            color: speakerOff ? Colors.white : Colors.red,
            backgroundColor: speakerOff ? Colors.black54 : Colors.white,
            onPressed: () {
              setState(() {
              speakerOff = !speakerOff; 
            });
            },
          ),
          buildCircularButton(
            icon: Icons.add_call,
            color: Colors.white,
            backgroundColor: Colors.black54,
            onPressed: () {
            },
          ),
          buildCircularButton(
            icon: Icons.call_end,
            color: Colors.white,
            backgroundColor: Colors.red,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ],
  );
  }
}

