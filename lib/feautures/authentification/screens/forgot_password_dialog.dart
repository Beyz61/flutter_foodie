import 'package:flutter/material.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:provider/provider.dart';

class ForgotPasswotDialog extends StatelessWidget {
  const ForgotPasswotDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    Future<void> resetPassword() async {
      final authRepo = Provider.of<AuthRepository>(context, listen: false);
      try {
        await authRepo.sendPasswordResetEmail(emailController.text.trim());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwort-Reset-E-Mail gesendet")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Fehler beim Senden der Passwort-Reset-E-Mail: ${e.toString()}")),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Passwort zurücksetzen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "E-Mail",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetPassword,
              child: const Text("Passwort zurücksetzen"),
            ),
          ],
        ),
      ),
    );
  }
}
