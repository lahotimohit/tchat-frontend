import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 62, 102, 197),
      secondary: Colors.white,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: colorscheme,
        scaffoldBackgroundColor: colorscheme.secondary,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Text("Home Page..."),
      ),
    );
  }
}