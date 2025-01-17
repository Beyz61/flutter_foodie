import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:foodie_screen/feautures/authentification/screens/main_screen.dart';
import 'package:foodie_screen/feautures/authentification/widgets/sign_out_button.dart';
import 'package:foodie_screen/feautures/profile/screens/food_choices.dart';
import 'package:foodie_screen/feautures/profile/screens/user_screen.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isClickOn = true;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
              child: Column(
                children: [
                  const Text(
                  "Foodie ",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontFamily: "SFProDisplay",
                    color: Color.fromARGB(255, 80, 57, 50),
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.black,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                ),
                  const SizedBox(height: 10),
                  Image.asset(
                    "assets/images/iconfoodie1.png", 
                    height: 250,
                    width: 500,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.white), 
              title: const Text(
                "Benachrichtigungen",
                  style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              ),
                  ),
              trailing: Switch( // Switch ist ein zum an und aus machen
                value: isClickOn,
                onChanged: (value) {
                  setState(() {
                    isClickOn = value;
                  });
                },
                activeColor: isClickOn 
                ? const Color.fromARGB(255, 46, 37, 23) 
                : Colors.grey,
              ),
            ),
            const Divider(color: Color.fromARGB(255, 255, 255, 255),
            indent: 52,
            endIndent: 30,
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                "Benutzer", 
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserScreen()),
                );
              },
            ),
            const Divider(color: Color.fromARGB(255, 255, 255, 255),
            indent: 52,
            endIndent: 30,
            ),
            // ListTile(
            //   leading: const Icon(Icons.email, color: Colors.white),
            //   title: const Text(
            //     "E-Mail Adresse ändern",
            //   style: TextStyle(
            //   color: Colors.white,
            //   fontWeight: FontWeight.w600,
            //   fontStyle: FontStyle.italic,
            //   ), 
            //       ),
            //   trailing: const Icon(
            //     Icons.arrow_forward_ios, 
            //     color: Colors.white
            //     ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const ChangeEmailScreen()),
            //     );
            //   },
            // ),
            // const Divider(color: Color.fromARGB(255, 255, 255, 255),
            // indent: 52,
            // endIndent: 30,
            // ),
            ListTile(
              leading: const Icon(Icons.fastfood_sharp, color: Colors.white),
              title: const Text(
                "Essgewohnheiten", 
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              ),                
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FoodChoices()),
                );
              },
            ),
            // const Divider(color: Color.fromARGB(255, 255, 255, 255),
            // indent: 52,
            // endIndent: 30,
            // ),
            // ListTile(
            //   leading: const Icon(Icons.password_rounded, color: Colors.white),
            //   title: const Text(
            //     "Passwort ändern",
            //     style: TextStyle(
            //   color: Colors.white,
            //   fontWeight: FontWeight.w600,
            //   fontStyle: FontStyle.italic,
            //   ),
            //      ),
            //   trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            //   onTap: () {Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const ChangePassword()), // das muss ich noch ändern in password 
            //     );
            //   },
            // ),
            
            const Divider(color: Color.fromARGB(255, 255, 255, 255),
            indent: 52,
            endIndent: 30,
            ),
             const SizedBox(height: 40),
              SignOutButton(
              text: "Abmelden",
              onPressed: () async {
                final authRepository = context.read<AuthRepository>();
                await authRepository.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

