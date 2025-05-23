import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:tchat_frontend/src/animations/fade_pageroute.dart';
import 'package:tchat_frontend/src/api/session.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/screens/dashboard.dart';
import 'package:tchat_frontend/src/screens/splash.dart';

class StartScreen extends StatefulWidget {
  const StartScreen ({super.key, required this.nextScreen});
  final String nextScreen;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      if(mounted) {
        checkAndCallToGetSession();
        Navigator.of(context).pushAndRemoveUntil(
        fadeRoute(widget.nextScreen == "Splash" ?
        const SplashScreen()
        :const HomeMainScreen()),
        (route) => false);
      }
    });
  }

  void checkAndCallToGetSession() async {
  SecureStorage storage = SecureStorage();
  String? refreshToken = await storage.readData("refreshToken");

  if (refreshToken != null && refreshToken.isNotEmpty && mounted) {
    getSession(context);
}}

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Lottie.asset("assets/lottie/logo.json", fit: BoxFit.fill),
      ),
    );
  }
}