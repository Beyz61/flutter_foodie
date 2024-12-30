import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:provider/provider.dart';
//! Anmelde Button
class FoodieButton extends StatefulWidget {
  const FoodieButton({
    super.key, required this.text, 
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
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "/bottomnavigationbarmain");
    } catch (e) {
      // ignore: use_build_context_synchronously
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
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: login,
        
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          backgroundColor: signInBtnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
  

                //          TextStyle(
                //                 color: Color.fromARGB(255, 234, 220, 208),
                //  fontWeight: FontWeight.w600,
                //                 fontSize: 18,
                //                 fontStyle: FontStyle.italic,
                //                 fontFamily: "SFProDisplay",
                //               ),
                //             ),