import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:foodie_screen/data/repository/user_notifier.dart';
import 'package:foodie_screen/feautures/authentification/screens/login_screen.dart';
import 'package:foodie_screen/feautures/authentification/widgets/sign_out_button.dart';
import 'package:foodie_screen/feautures/profile/screens/user_screen.dart';
import 'package:foodie_screen/feautures/profile/widgets/delete_account_dialog.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final user = context.read<AuthRepository>().currentUser;
    if (user != null) {
      await context.read<UserNotifier>().loadUsername(user.userId);
    }
  }

  Future<void> _deleteAccount() async {
    final user = context.read<AuthRepository>().currentUser;
    if (user != null) {
      await context.read<AuthRepository>().deleteAccount(user.userId);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteAccountDialog(onDelete: _deleteAccount);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final username = context.watch<UserNotifier>().username;

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
              padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
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
                  const SizedBox(height: 0),
                  Center(
                    child: Image.asset(
                      "assets/images/iconfoodie1.png",
                      height: 190,
                      width: 200,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    username ?? "Kein Benutzername",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
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
                ],
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: const EdgeInsets.all(12.0), 
              decoration: BoxDecoration(
                color: darkblackWithOpacity,
                borderRadius: BorderRadius.circular(8.0), 
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
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: darkblackWithOpacity,
                borderRadius: BorderRadius.circular(8.0), 
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
                leading: const Icon(Icons.delete, color: Color.fromARGB(255, 246, 191, 143), shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black,
                    offset: Offset(1, 2),
                  ),
                ]),
                title: const Text(
                  "Konto löschen",
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
                onTap: _showDeleteAccountDialog,
              ),
            ),
            const SizedBox(height: 20),
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

