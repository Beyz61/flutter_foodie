import "package:flutter/material.dart";
import "package:foodie_screen/config/colors.dart";
import "package:foodie_screen/data/repository/app_user.dart";
import "package:foodie_screen/data/repository/auth_repository.dart";
import "package:foodie_screen/feautures/authentification/screens/sign_up_screen.dart";
import "package:foodie_screen/feautures/authentification/widgets/forgot_password_dialog.dart";
import "package:foodie_screen/feautures/authentification/widgets/login_button.dart";
import "package:foodie_screen/feautures/authentification/widgets/mail_button.dart";
import "package:foodie_screen/feautures/authentification/widgets/password_button.dart";
import "package:foodie_screen/feautures/authentification/widgets/richtlinien_widget.dart";
import "package:foodie_screen/shared/widgets/buttom_navigator.dart";
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Future<void> login() async {
      final authRepo = Provider.of<AuthRepository>(context, listen: false);
      try {
        await authRepo.signInWithEmailAndPassword(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ButtonNavigator()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login fehlgeschlagen")),
        );
      }
    }

    return Scaffold(
      body: StreamBuilder<AppUser?>(
        stream: context.read<AuthRepository>().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user != null) {
              return const ButtonNavigator();
            } else {
              return _buildLoginForm(context, emailController, passwordController, login);
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, TextEditingController emailController, TextEditingController passwordController, Future<void> Function() login) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
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
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: screenWidth * 0.20),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/newfoodieicon.png",
                  height: screenHeight * 0.25,
                  width: screenWidth * 0.6,
                ),
                SizedBox(height: screenHeight * 0.02),
                const Divider(
                  thickness: 1,
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromARGB(255, 103, 71, 31),
                ),
                MailButton(
                  text: "E-Mail",
                  controller: emailController,
                ),
                const SizedBox(height: 0),
                PasswordButton(
                  text: "Passwort",
                  controller: passwordController,
                ),
                SizedBox(height: screenHeight * 0.001),
                GestureDetector(
                  onTap: () => showForgotPasswordDialog(context),
                  child: Text(
                    "Passwort vergessen?",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Divider(
                  thickness: 1,
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromARGB(255, 103, 71, 31),
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomButton.LoginButton(
                  text: "Anmelden",
                  onPressed: login,
                  backgroundColor: signInBtnColor,
                  textColor: const Color.fromARGB(255, 45, 25, 7),
                  borderColor: const Color.fromARGB(255, 45, 39, 39),
                ),
                SizedBox(height: screenHeight * 0.01),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Kein Account? ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.normal,
                      ),
                      children: const [
                        TextSpan(
                          text: "Registrieren",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
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
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          context.read<AuthRepository>().signInWithGoogle();
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
        ),
      ),
    );
  }
}
