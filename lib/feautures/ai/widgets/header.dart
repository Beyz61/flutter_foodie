import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Chat mit Foodie",
        style: TextStyle(
          fontSize: 30,
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
    );
  }
}
