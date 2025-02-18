import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class SignOutButton extends StatefulWidget {
  const SignOutButton({
    super.key, required this.text, required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 24, 23, 22), Color.fromARGB(255, 75, 67, 59)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: blackWithOpacity,
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color.fromARGB(255, 242, 101, 8), width: 0.5),
          ),
        ),
        child: Text(
          widget.text,style: const TextStyle(
            color: Color.fromARGB(255, 242, 101, 8),
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
            ),
          ),
      ),
    );
  }
}