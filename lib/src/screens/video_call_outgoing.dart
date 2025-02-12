import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/call/app_bar.dart';
import 'package:tchat_frontend/src/widgets/call/bottom_bar.dart';

class VideoCallOutgoingScreen extends StatefulWidget{
  const VideoCallOutgoingScreen({super.key, required this.username});
  final String username;

  @override
  State<VideoCallOutgoingScreen> createState() => _VideoCallOutgoingScreenState();
}

class _VideoCallOutgoingScreenState extends State<VideoCallOutgoingScreen> {
  @override
  Widget build(BuildContext context) {
    String bigImage =
      "https://cdn.pixabay.com/photo/2018/10/08/13/05/hindu-3732713_1280.jpg";
  String smallImage =
      "https://cdn.pixabay.com/photo/2021/06/04/05/45/god-6308823_1280.jpg";


    return Scaffold(
      backgroundColor: white,
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        CallAppBar(username: widget.username),
        Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              SizedBox(
                width: 300,
                height: 500,
                child: Image.network(
                  bigImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 16,
                right: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                      child: ClipOval(
                        child: Image.network(
                          smallImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
        const CallBottomBar()
      ],)),
    );
  }
}