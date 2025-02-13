import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:tchat_frontend/src/common.dart';
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
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => widget.nextScreen == "Splash" ?
        const SplashScreen()
        :const HomeMainScreen()));
    });
  }

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