import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:tchat_frontend/chats/screen/main.dart';
import 'package:tchat_frontend/video_call/screen/main.dart';
import 'package:tchat_frontend/voice_call/screens/main.dart';

void showProfileImage(
    BuildContext context, String profileImage, String username) {
  showCupertinoDialog(
    context: context,
    builder: (ctx) {
      return Stack(
        alignment: Alignment.center,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              color: Colors.black.withOpacity(0.8),
              width: 2,
              height: 2,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 150,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/user.jpg',
                      image: profileImage,
                      fit: BoxFit.cover,
                      width: 300,
                      height: 300,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/user.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  itemButton(
                      context: context,
                      icon: Icons.message,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => ChatMainScreen(
                                username: username,
                                profileImage: profileImage,
                                status: "Online")));
                      }),
                  itemButton(
                      context: context,
                      icon: Icons.call,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => VoiceCallScreen(
                                isIncoming: false,
                                userName: username,
                                userPhoto: profileImage)));
                      }),
                  itemButton(
                      context: context,
                      icon: Icons.video_call,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const VideoCallScreen()));
                      }),
                  itemButton(context: context, icon: Icons.info, onTap: () {})
                ],
              )
            ],
          ),
        ],
      );
    },
  );
}

Widget itemButton(
    {required BuildContext context,
    required IconData icon,
    required VoidCallback onTap}) {
  return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.white,
        size: 36,
      ));
}
