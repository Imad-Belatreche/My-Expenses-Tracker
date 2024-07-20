import 'package:expanses_track/pages/home_page.dart';
import 'package:expanses_track/theme/dark_theme.dart';
import 'package:expanses_track/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}