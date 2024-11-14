import 'package:flutter/material.dart';
import 'package:foodie_screen/config/themes.dart';
import 'package:foodie_screen/feautures/authentification/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodie",
      theme: myTheme,
      home: const MainScreen(),
    );
  }
}