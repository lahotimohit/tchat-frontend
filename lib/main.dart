import 'package:flutter/material.dart';
import 'package:tchat_frontend/home/screen/main.dart';
import 'package:tchat_frontend/services/storage.dart';
import 'package:tchat_frontend/splash_screen/screen/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SecureStorage _storage = SecureStorage();
  String? email;

  @override
  void initState() {
    super.initState();
    takingSecureEmail();
  }

  void takingSecureEmail() async {
    String? fetchedEmail = await _storage.readData("email");
    setState(() {
      email = fetchedEmail;
    });
    print("email at initialisation is: ${email}");
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color.fromARGB(255, 62, 102, 197),
        primary: const Color.fromARGB(255, 62, 102, 197),
        surface: Colors.white);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: colorscheme,
        scaffoldBackgroundColor: colorscheme.surface,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: email == null ? SplashScreen() : HomeMainScreen(),
      ),
    );
  }
}
