import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchat_frontend/home/screen/main.dart';
import 'package:tchat_frontend/services/storage.dart';
import 'package:tchat_frontend/splash_screen/screen/main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SecureStorage _storage = SecureStorage();
  String? accessToken;

  @override
  void initState() {
    super.initState();
    secureTokenAccess();
  }

  void secureTokenAccess() async {
    String? fetchedToken = await _storage.readData("access_token");
    setState(() {
      accessToken = fetchedToken;
    });
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
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: colorscheme.primary,
            statusBarIconBrightness: Brightness.light, // For Android
            statusBarBrightness: Brightness.dark, // For iOS
          ),
          child: child!,
        );
      },
      home: Scaffold(
        body:
            accessToken == null ? const SplashScreen() : const HomeMainScreen(),
      ),
    );
  }
}
