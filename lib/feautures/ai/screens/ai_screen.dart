import 'package:flutter/material.dart';

class AIScreen extends StatelessWidget {
  const AIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 218, 211),
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
                  opacity: 0.2,
                  child: Image.asset(
                    "assets/icon/icon.png",
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
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
