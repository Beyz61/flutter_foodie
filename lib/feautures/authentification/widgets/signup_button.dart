import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:provider/provider.dart';
//! Registrierungs Button
class signUpButton extends StatefulWidget {
  const signUpButton({
    super.key, required this.text, required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  State<signUpButton> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<signUpButton> {

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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackWithOpacity,
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          backgroundColor: signInBtnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color.fromARGB(255, 45, 39, 39), width: 1), // Outline border
          ),
        ),
        child: Text(
          widget.text,style: const TextStyle(
            color: Color.fromARGB(255, 45, 25, 7),
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
            ),
          ),
      ),
    );
  }
}