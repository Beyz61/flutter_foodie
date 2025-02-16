import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 70,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      fontFamily: "SFProDisplay",
      color: Color.fromARGB(255, 80, 57, 50),
      shadows: [
        Shadow(
          blurRadius: 10,
          color: Colors.black,
          offset: Offset(4, 2),
        ),
      ],
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.white,
    ), // 2
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.white70,
      fontFamily: "SFProDisplay",
    ), // 3
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 80, 57, 50),
    ), // 4
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ), // 5
  ),
  scaffoldBackgroundColor: Colors.transparent, // 6
  primaryColor: const Color.fromARGB(255, 80, 57, 50), // 7
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 103, 71, 31),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ), // 8
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 80, 57, 50), // Hintergrundfarbe der Buttons
    textTheme: ButtonTextTheme.primary,
  ),
  fontFamily: "SFProDisplay",
);
