import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Benutzer"),
      backgroundColor: backroundColor1,),
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
              const TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
                  ),
                ),
                style: TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: "E-Mail",
                  labelStyle: TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
                  ),
                ),
              style: TextStyle(color: Color.fromARGB(255, 78, 50, 13)),

              ),
              // const SizedBox(height: 20),
              // const TextField(
              //   decoration: InputDecoration(
              //     labelText: "Neuer Benutzername",
              //     labelStyle: TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
              //     ),
              //   ),
              //   style: TextStyle(color: Color.fromARGB(255, 78, 50, 13)),              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: backroundColor1),
                onPressed: () {
                  // 
                },
                child: const Text("Speichern",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}