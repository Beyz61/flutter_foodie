import "package:flutter/material.dart";
import "package:foodie_screen/config/colors.dart";
import "package:foodie_screen/data/repository/auth_repository.dart";
import "package:foodie_screen/data/repository/user_repository.dart";
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
  final UserRepository _userRepository = UserRepository();

  Future<void> _saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", username);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: IntrinsicHeight(
            child: Container(
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
                    top: screenHeight * 0.3,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Opacity(
                        opacity: 0.3,
                        child: Image.asset(
                          "assets/images/newfoodieicon.png",
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.4,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.05, bottom: screenHeight * 0.01),
                          child: Center(
                            child: Text(
                              "Foodie",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: screenWidth * 0.22),
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
                        SizedBox(height: screenHeight * 0.02),
                        const Divider(
                          thickness: 0.9,
                          height: 20,
                          indent: 20,
                          endIndent: 20,
                          color: Color.fromARGB(255, 103, 71, 31),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        MailButton(text: "E-Mail", controller: emailController),
                        MailButton(text: "Benutzername", controller: usernameController),
                        PasswordButton(text: "Passwort", controller: passwordController),
                        PasswordButton(text: "Passwort", controller: repeatPasswordController),
                        SizedBox(height: screenHeight * 0.02),
                        const Divider(
                          thickness: 0.9,
                          height: 20,
                          indent: 20,
                          endIndent: 20,
                          color: Color.fromARGB(255, 103, 71, 31),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: CustomButton.LoginButton(
                            text: "Registrieren",
                            onPressed: () async {
                              if (passwordController.text == repeatPasswordController.text) {
                                try {
                                  final user = await context.read<AuthRepository>().createWithEmailAndPassword(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                  if (user != null) {
                                    await _userRepository.saveUsername(user.userId, usernameController.text);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const ButtonNavigator()),
                                    );
                                  }
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
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.15,
                              height: screenWidth * 0.15,
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
                                onPressed: () async {
                                  await context.read<AuthRepository>().signInWithGoogle();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ButtonNavigator()),
                                  );
                                },
                                child: Image.asset(
                                  "assets/icon/google.png",
                                  height: screenWidth * 0.08,
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
                        SizedBox(height: screenHeight * 0.03),
                        const RichtlinienWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}