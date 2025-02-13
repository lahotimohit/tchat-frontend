import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/screens/start.dart';

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
        seedColor: const Color.fromARGB(255, 36, 145, 255),
        primary: const Color.fromARGB(255, 36, 145, 255),
        surface: Colors.white);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TChat',
      theme: ThemeData(
        colorScheme: colorscheme,
        scaffoldBackgroundColor: colorscheme.surface,
        useMaterial3: true,
      ),
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 244, 244, 244),
            statusBarIconBrightness: Brightness.dark, // For Android
            statusBarBrightness: Brightness.dark, // For iOS
          ),
          child: child!,
        );
      },
      home: const Scaffold(  
        body: 
        StartScreen(nextScreen: "Splash")
        // accessToken == null ? const SplashScreen() : const HomeMainScreen(),
        // HomeMainScreen()
      ),
    );
  }
}
