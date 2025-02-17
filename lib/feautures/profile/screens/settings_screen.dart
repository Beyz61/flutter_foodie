import 'package:flutter/material.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:foodie_screen/feautures/authentification/screens/login_screen.dart';
import 'package:foodie_screen/feautures/authentification/widgets/sign_out_button.dart';
import 'package:foodie_screen/feautures/profile/screens/user_screen.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();
    final user = authRepository.currentUser;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 23, 22),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 75, 67, 59),
              Color.fromARGB(255, 24, 23, 22),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0, bottom: 20.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Foodie",
                      style: TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontFamily: "SFProDisplay",
                        color: Color.fromARGB(255, 242, 101, 8),
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(1, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Image.asset(
                      "assets/images/iconfoodie1.png",
                      height: 260,
                      width: 300,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.white, width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: const Icon(Icons.person, color: Color.fromARGB(255, 246, 191, 143), shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black,
                    offset: Offset(1, 2),
                  ),
                ]),
                title: const Text(
                  "Benutzer",
                  style: TextStyle(
                    color: Color.fromARGB(255, 246, 191, 143),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.black,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                ),
                trailing: const Icon(Icons.edit, color: Color.fromARGB(255, 246, 191, 143), shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black,
                    offset: Offset(1, 2),
                  ),
                ]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            SignOutButton(
              text: "Abmelden",
              onPressed: () async {
                final authRepository = context.read<AuthRepository>();
                await authRepository.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

