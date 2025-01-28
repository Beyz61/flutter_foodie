import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authRepository = context.read<AuthRepository>();
    final user = authRepository.currentUser;
    if (user != null) {
      _emailController.text = user.email ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Benutzer"),
        backgroundColor: backroundColor1,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backroundColor2,
              backroundColor1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "E-Mail",
                  labelStyle: TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
                  ),
                ),
                style: const TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: backroundColor1),
                onPressed: () async {
                  final authRepository = context.read<AuthRepository>();
                  final email = _emailController.text;
                  if (email.isNotEmpty) {
                    try {
                      await authRepository.updateEmail(email);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("E-Mail erfolgreich aktualisiert")),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Fehler beim Aktualisieren der E-Mail: $e")),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("E-Mail darf nicht leer sein")),
                    );
                  }
                },
                child: const Text("Speichern", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}