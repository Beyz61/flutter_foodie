import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:provider/provider.dart';
//! Anmelde Button
class FoodieButton extends StatefulWidget {
  const FoodieButton({
    super.key, required this.text, required Function() onPressed, 
  });

  final String text;


  @override
  State<FoodieButton> createState() => _FoodieButtonState();
}

class _FoodieButtonState extends State<FoodieButton> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

    Future<void> login() async {
    final authRepo = Provider.of<AuthRepository>(context, listen: false);
    try {
      await authRepo.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      Navigator.pushNamed(context, "/bottomnavigationbarmain");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login fehlgeschlagen: ${e.toString()}")),
      );

      dev.log("Fehler beim Login: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: darkblackWithOpacity,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: [
          BoxShadow(
            color: blackWithOpacity,
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: login,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.25,
            vertical: screenHeight * 0.02,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.035,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
          ),
        ),
      ),
    );
  }
}


