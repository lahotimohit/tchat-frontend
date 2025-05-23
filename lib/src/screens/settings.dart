import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/animations/fade_pageroute.dart';
import 'package:tchat_frontend/src/models/profile_option.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/screens/profile.dart';
import 'package:tchat_frontend/src/screens/start.dart';
import 'package:tchat_frontend/src/widgets/custom_elevated_button.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class SettingMainScreen extends StatefulWidget {
  const SettingMainScreen({super.key});

  @override
  State<SettingMainScreen> createState() => _SettingMainScreenState();
}

class _SettingMainScreenState extends State<SettingMainScreen> {
  Map<String, dynamic> session = {};
    final List<ProfileOption> options = [
    ProfileOption(icon: SvgPicture.asset("assets/svgs/settings/account.svg"), title: 'Account', subtitle: "Security notifications, change number"),
    ProfileOption(icon: SvgPicture.asset("assets/svgs/settings/privacy.svg"), title: 'Privacy', subtitle: "Block Contacts, check privacy policy"),
    ProfileOption(icon: SvgPicture.asset("assets/svgs/settings/chats.svg"), title: 'Chats', subtitle: "Chat history, wallpapers"),
    ProfileOption(icon: SvgPicture.asset("assets/svgs/settings/notifications.svg"), title: 'Notifications', subtitle: "Message, group & call tones"),
    ProfileOption(icon: SvgPicture.asset("assets/svgs/settings/subscriptions.svg"), title: 'All Subscriptions', subtitle: "Use all features with premium plans"),
    ProfileOption(icon: SvgPicture.asset("assets/svgs/settings/storage.svg"), title: 'Storage & Data', subtitle: "Network usage, auto-download"),
    ProfileOption(icon: SvgPicture.asset("assets/svgs/settings/help.svg"), title: 'Help', subtitle: "Help center, contact us")
  ];

  @override
  void initState() {
    super.initState();
    getSession();
  }

  void getSession() async{
    SecureStorage storage = SecureStorage();
    await storage.readData("session").then((value) {
      setState(() {
        session = jsonDecode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: black,),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        title: const CustomText(text:  "Settings", size: 20, weight: FontWeight.w500,),
        actions: [
          SvgPicture.asset("assets/svgs/magnifier.svg", colorFilter: const ColorFilter.mode(black, BlendMode.srcIn),),
          const SizedBox(width: 20,)
        ]
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Padding(
      padding:  EdgeInsets.all(8.0),
      child:  CircleAvatar(
        backgroundImage: NetworkImage(
          session['profilePicture'] ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
        ),
        radius: 30,
      ),
    ),
    Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: session['name'] ?? "User",
              size: 18,
              weight: FontWeight.w500,
            ),
            CustomText(
              text: "Available on TChat only",
              size: 12,
              color: Color.fromARGB(255, 106, 112, 124),
              maxlines: 2,
              overflow: TextOverflow.visible,
              isSoftWrap: true,
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(fadeRoute(ProfileScreen(session: session,)));
      },
      child: SvgPicture.asset("assets/svgs/add_profile.svg")),
    const SizedBox(width: 15,)
  ],
),

            const Divider(color: Colors.grey, thickness: 0.4,),
            Expanded(
            child: ListView.separated(
              itemCount: options.length,
              separatorBuilder: (context, index) => const SizedBox.shrink(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: options[index].icon,
                  title: CustomText(text: options[index].title, size: 16, weight: FontWeight.w500,),
                  subtitle: options[index].subtitle.isNotEmpty
            ? 
            CustomText(text: options[index].subtitle, size: 13, color: const Color.fromARGB(255, 106, 112, 124),)
            : null,
                  onTap: () {},
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              SecureStorage storage = SecureStorage();
              storage.deleteData("accessToken");
              storage.deleteData("refreshToken");
              storage.deleteData("isLoggedIn");
              storage.deleteData("session");
              Navigator.of(context).pushAndRemoveUntil(
                fadeRoute(const StartScreen(nextScreen: "Splash"))
                , (route) => false);
            },
            style: customElevatedButton(), 
            child: const CustomText(text: "Log Out", color: white, alignment: Alignment.center,))
          ],),
        ),
      );
  }
}