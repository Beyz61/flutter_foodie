import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:foodie_screen/config/colors.dart";
import 'package:foodie_screen/data/repository/user_notifier.dart';
import "package:foodie_screen/feautures/authentification/widgets/sign_out_button.dart";
import "package:provider/provider.dart";

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final user = _auth.currentUser;
    if (user != null) {
      await context.read<UserNotifier>().loadUsername(user.uid);
    }
  }

  Future<void> _saveUsername(String newUsername) async {
    final user = _auth.currentUser;
    if (user != null) {
      await context.read<UserNotifier>().saveUsername(user.uid, newUsername);
    }
  }

  void _showEditUsernameDialog() {
    final username = context.read<UserNotifier>().username;
    _usernameController.text = username ?? "";
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
            "Benutzernamen ändern",
            style: TextStyle(
              color: Color.fromARGB(255, 246, 191, 143),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
          ),
          content: TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: "Neuer Benutzername",
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
              onPressed: () {
                _saveUsername(_usernameController.text);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Speichern",
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

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    final username = context.watch<UserNotifier>().username;
    final screenWidth = MediaQuery.of(context).size.width;

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
        child: Stack(
            children: [
            Positioned(
              top: screenWidth * 0.68,
              left: 0,
              right: 0,
              child: Center(
              child: Opacity(
                opacity: 0.8,
                child: LayoutBuilder(
                builder: (context, constraints) {
                  final imageSize = constraints.maxWidth * 0.87;
                  return Image.asset(
                  "assets/images/newfoodieicon.png",
                  width: imageSize,
                  height: imageSize,
                  );
                },
                ),
              ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Foodie",
                    style: TextStyle(
                      fontSize: 108,
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
                  SizedBox(height: screenWidth * 0.00),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 14.0),
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: blackWithOpacity,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: const Color.fromARGB(255, 253, 110, 0), width: 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          username ?? "Kein Benutzername",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: "SFProDisplay",
                            color: Color.fromARGB(255, 255, 255, 255),
                            shadows: [
                              Shadow(
                                blurRadius: 5,
                                color: Colors.black,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Color.fromARGB(255, 255, 255, 255)),
                          onPressed: _showEditUsernameDialog,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.07),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 16.0),
                    padding: EdgeInsets.all(screenWidth * 0.07),
                    decoration: BoxDecoration(
                      color: darkblackWithOpacity,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 255, 108, 3),
                          shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(1, 2),
                          ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          user?.email ?? "Keine E-Mail",
                          style: const TextStyle(
                          color: Color.fromARGB(255, 255, 108, 3),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontFamily: "SFProDisplay",
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
                      const Divider(
                        color: Color.fromARGB(255, 255, 108, 3),
                        indent: 4,
                        endIndent: 24,
                        thickness: 2,
                        height: 20,
                      ),
                      TextField(
                        controller: _currentPasswordController,
                        obscureText: !_isCurrentPasswordVisible,
                        decoration: InputDecoration(
                        labelText: "Aktuelles Passwort",
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 250, 245)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                          _isCurrentPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          onPressed: () {
                          setState(() {
                            _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                          });
                          },
                        ),
                        ),
                        style: const TextStyle(
                        color: Color.fromARGB(255, 255, 254, 254),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        fontFamily: "SFProDisplay",
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _newPasswordController,
                        obscureText: !_isNewPasswordVisible,
                        decoration: InputDecoration(
                        labelText: "Neues Passwort",
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 252, 250)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                          _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          onPressed: () {
                          setState(() {
                            _isNewPasswordVisible = !_isNewPasswordVisible;
                          });
                          },
                        ),
                        ),
                        style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 254),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        fontFamily: "SFProDisplay",
                        ),
                      ),
                      ],
                    ),
                    ),
                  SizedBox(height: screenWidth * 0.2),
                  SignOutButton(
                    text: "Speichern",
                    onPressed: () async {
                      final currentPassword = _currentPasswordController.text;
                      final newPassword = _newPasswordController.text;
                      if (currentPassword.isNotEmpty && newPassword.isNotEmpty) {
                        try {
                          final credential = EmailAuthProvider.credential(
                            email: user?.email ?? "",
                            password: currentPassword,
                          );
                          await user?.reauthenticateWithCredential(credential);
                          await user?.updatePassword(newPassword);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Passwort erfolgreich aktualisiert")),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Fehler beim Aktualisieren des Passworts")),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Passwörter dürfen nicht leer sein")),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}