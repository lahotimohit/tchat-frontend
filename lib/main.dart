import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchat_frontend/src/api/session.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:tchat_frontend/src/screens/start.dart';
import 'package:tchat_frontend/src/screens/temp_contact.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SecureStorage _storage = SecureStorage();
  String? accessToken;
  String? isRegister;
  String? isLoggedIn;

  @override
  void initState() {
    super.initState();
    secureTokenAccess();
  }

  void secureTokenAccess() async {
    String? fetchedToken = await _storage.readData("accessToken");
    String? register = await _storage.readData("isRegister");
    String? login = await _storage.readData("isLoggedIn");
    setState(() {
      accessToken = fetchedToken;
      isRegister = register;
      isLoggedIn = login;
    });
    print("access Token $accessToken, isRegister $isRegister, isLoggedIn $isLoggedIn");
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
        fontFamily: "Poppins",
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
      home: Scaffold(
      body: Builder(
      builder: (context) {
        if (accessToken != null && isRegister == "true" && isLoggedIn == null) {
          return const TempContactScreen();
        } else if (accessToken != null && isLoggedIn == "true") {
          getSession(context);
          return const StartScreen(nextScreen: "Home",);
        } else {
          return const StartScreen(nextScreen: "Splash",);
        }
      },
  ),
));}}
