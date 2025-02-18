import "package:flutter/material.dart";
import "package:foodie_screen/config/colors.dart";
import "package:foodie_screen/data/repository/auth_repository.dart";
import "package:foodie_screen/feautures/authentification/widgets/login_button.dart";
import "package:foodie_screen/feautures/authentification/widgets/mail_button.dart";
import "package:foodie_screen/feautures/authentification/widgets/password_button.dart";
import "package:foodie_screen/feautures/authentification/widgets/richtlinien_widget.dart";
import "package:foodie_screen/shared/widgets/buttom_navigator.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key}); 

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

  Future<void> _saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Stack(
          children: [
            Positioned(
              top: 265,
              left: 0,
              right: 0,
              child: Center(
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/icon/icon.png",
                    width: 320,
                    height: 320,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 10),
                    child: Center(
                      child: Text(
                        "Foodie",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  const Text(
                    "Erstelle dein kostenloses\nRezeptbuch",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SFProDisplay",
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 80, 57, 50),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 0.9,
                    height: 20,
                    indent: 20, // abstand links
                    endIndent: 20, // abstand rechts
                    color: Color.fromARGB(255, 103, 71, 31),
                  ),
                  const SizedBox(height: 20),
                  MailButton(text: "E-Mail", controller: emailController),
                  MailButton(text: "Benutzername", controller: usernameController),
                  PasswordButton(text: "Passwort", controller: passwordController),
                  PasswordButton(text: "Passwort", controller: repeatPasswordController),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 0.9,
                    height: 20,
                    indent: 20, // abstand links
                    endIndent: 20, // abstand rechts
                    color: Color.fromARGB(255, 103, 71, 31),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton.LoginButton(
                      text: "Registrieren",
                      onPressed: () async {
                        if (passwordController.text == repeatPasswordController.text) {
                          try {
                            await context.read<AuthRepository>().createWithEmailAndPassword(
                              emailController.text,
                              passwordController.text,
                            );
                            await _saveUsername(usernameController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ButtonNavigator()),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Registrierung fehlgeschlagen")),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Passwords do not match")),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: blackWithOpacity,
                        offset: const Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () async{
                      await context.read<AuthRepository>().signInWithGoogle();
                    //  if(context.read<AuthRepository>.currentUser != null) {Navigator.push}
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ButtonNavigator())); 
                    },
                    child: Image.asset(
                      "assets/icon/google.png",
                      height: 30,
                    ),
                  ),
                ),
                      //! Apple Login
                      // const SizedBox(width: 20),
                      // Container(
                      //   width: 60,
                      //   height: 60,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black),
                      //     borderRadius: BorderRadius.circular(12),
                      //     color: Colors.black,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black.withOpacity(0.3),
                      //         offset: const Offset(0, 4),
                      //         blurRadius: 6,
                      //       ),
                      //     ],
                      //   ),
                      //   child: TextButton(
                      //     onPressed: () {
                      //       print("Apple");
                      //     },
                      //     child: Image.asset(
                      //       "assets/icon/Apple_logo_white.svg.png",
                      //       height: 30,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const RichtlinienWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}