import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const CustomButton.LoginButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color.fromARGB(255, 232, 196, 164),
    this.textColor = const Color.fromARGB(255, 45, 25, 7),
    this.borderColor = const Color.fromARGB(255, 45, 39, 39),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackWithOpacity,
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: borderColor, width: 1),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
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
