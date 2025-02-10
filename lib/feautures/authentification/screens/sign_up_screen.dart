import "package:flutter/material.dart";
import "package:foodie_screen/config/colors.dart";
import "package:foodie_screen/data/repository/auth_repository.dart";
import "package:foodie_screen/feautures/authentification/widgets/mail_button.dart";
import "package:foodie_screen/feautures/authentification/widgets/password_button.dart";
import "package:foodie_screen/feautures/authentification/widgets/richtlinien_widget.dart";
import "package:foodie_screen/feautures/authentification/widgets/signup_button.dart";
import "package:foodie_screen/feautures/feed/screens/feed_screen.dart";
import "package:foodie_screen/shared/widgets/buttom_navigator.dart";
import "package:provider/provider.dart";


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
        padding: const EdgeInsets.all(16.0),
      //  child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Padding(
                padding: const EdgeInsets.only(top: 65, bottom: 10),
                child: Center(
                  child: Text(
                    "Foodie",
                    style: Theme.of(context).textTheme.titleLarge,
                  
                  ),                        
                  //style: Theme.of(context).textTheme.titleLarge   
                ),
              ),
               const Text(
              "Erstelle dein kostenloses\n            Rezeptbuch",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
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
              MailButton(text: "E-Mail", controller: emailController),
              MailButton(text: "Username", controller: usernameController),
              PasswordButton(text: "Password", controller: passwordController),
              PasswordButton(text: "Repeat Password", controller: repeatPasswordController),
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
                child: signUpButton(
                text: "Sign Up!",
                onPressed: () async {
                  if (passwordController.text == repeatPasswordController.text) {
                    try {
                      await context.read<AuthRepository>().createWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ButtonNavigator()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Registration failed: ${e.toString()}")),
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
               const SizedBox(height: 30),
              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
      //  border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
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
        onPressed: () {context.read<AuthRepository>().signInWithGoogle();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FeedScreen(),
                ));
        },
        child: Image.asset(
          "assets/icon/google.png",
          height: 30,
        ),
      ),
    ),
    const SizedBox(width: 20),
    Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
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
          print("Apple");
        },
        child: Image.asset(
          "assets/icon/Apple_logo_white.svg.png",
          height: 30,
                  ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const RichtlinienWidget(),
          ],
        ),
      ),
    );
  }
}