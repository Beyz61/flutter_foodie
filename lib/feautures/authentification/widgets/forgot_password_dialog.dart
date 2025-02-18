import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:provider/provider.dart';

void showForgotPasswordDialog(BuildContext context) {
  final emailController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: darkblackWithOpacity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.white, width: 1),
        ),
        title: const Text(
          "Passwort zurücksetzen",
          style: TextStyle(
            color: Color.fromARGB(255, 246, 191, 143),
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
          ),
        ),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: "E-Mail",
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 250, 245)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 250, 245)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 250, 245)),
            ),
          ),
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 254, 254),
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Abbrechen",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 108, 3),
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontFamily: "SFProDisplay",
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              final authRepo = Provider.of<AuthRepository>(context, listen: false);
              try {
                await authRepo.sendPasswordResetEmail(emailController.text.trim());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Passwort-Reset-E-Mail gesendet")),
                );
                Navigator.of(context).pop();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Fehler beim Senden der Passwort-Reset-E-Mail: ${e.toString()}")),
                );
              }
            },
            child: const Text(
              "Senden",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 108, 3),
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontFamily: "SFProDisplay",
              ),
            ),
          ),
        ],
      );
    },
  );
}
