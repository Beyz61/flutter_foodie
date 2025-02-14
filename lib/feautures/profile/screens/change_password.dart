import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}
class _ChangePasswordState extends State<ChangePassword> {
  // damit ich es überhupt umschalten kann 
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passwort"),
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
              // aktuelles passwort
              TextField(
                obscureText: !_isCurrentPasswordVisible, 
                decoration: InputDecoration(
                  labelText: "Aktuelles Passwort",
                  labelStyle: const TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isCurrentPasswordVisible 
                      ? Icons.visibility 
                      : Icons.visibility_off,
                      color: const Color.fromARGB(255, 78, 50, 13),
                    ),
                    onPressed: () {
                      setState(() {
                        _isCurrentPasswordVisible = 
                        !_isCurrentPasswordVisible; // Sichtbarkeeit
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Passwort
              TextField(
                obscureText: !_isNewPasswordVisible, 
                decoration: InputDecoration(
                  labelText: "Neues Passwort",
                  labelStyle: const TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 52, 42, 29)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 52, 42, 29)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isNewPasswordVisible 
                      ? Icons.visibility 
                      : Icons.visibility_off,
                      color: const Color.fromARGB(255, 52, 42, 29),
                    ),
                    onPressed: () {
                      setState(() { // sichtbar oder nicht 
                        _isNewPasswordVisible = 
                        !_isNewPasswordVisible; 
                      });
                    },
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),

              
              ElevatedButton(     // Buttom zum speichern 
                style: ElevatedButton.styleFrom(
                  backgroundColor: backroundColor1,
                ),
                onPressed: () {
                  // hier muss ich das zum speichern eintragen 
                },
                child: const Text(
                  "Speichern",
                  style: TextStyle(color: Color.fromARGB(255, 255, 253, 252)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}