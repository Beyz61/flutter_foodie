import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackWithOpacity,
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: withedarkWithOpacity,
          width: 1,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          backgroundColor: const Color.fromARGB(255, 24, 23, 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 5,
          shadowColor: blackWithOpacity,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 242, 101, 8),
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
            shadows: [
              Shadow(
                offset: Offset(0, 2),
                blurRadius: 4,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}