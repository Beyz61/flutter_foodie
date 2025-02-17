import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:foodie_screen/feautures/authentification/widgets/sign_out_button.dart";
import "package:shared_preferences/shared_preferences.dart";

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
  String? username;
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username");
    });
  }

  Future<void> _saveUsername(String newUsername) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", newUsername);
    setState(() {
      username = newUsername;
    });
  }

  void _showEditUsernameDialog() {
    _usernameController.text = username ?? "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.8),
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
              top: 290,
              left: 0,
              right: 0,
              child: Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Image.asset(
                    "assets/images/iconfoodie1.png",
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
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
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(81, 0, 0, 0).withOpacity(0.6),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          username ?? "Kein Benutzername",
                          style: const TextStyle(
                            fontSize: 18,
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
                  const SizedBox(height: 39),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(81, 0, 0, 0).withOpacity(0.6),
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
                          indent: 52,
                          endIndent: 30,
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
                  const SizedBox(height: 75),
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