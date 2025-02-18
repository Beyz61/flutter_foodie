import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class MailButton extends StatefulWidget {
  const MailButton({
    super.key,
    required this.text,
    required this.controller,
  });

  final String text;
  final TextEditingController controller;

  @override
  State<MailButton> createState() => _MailButtonState();
}

class _MailButtonState extends State<MailButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 232, 196, 164),
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: const Color.fromARGB(255, 45, 39, 39), width: 1), 
          boxShadow: [
            BoxShadow(
              color: blackWithOpacity,
              offset: const Offset(0, 4), 
              blurRadius: 6, 
            ),
          ],
        ),
        child: Stack(
          children: [
            TextField(
              controller: widget.controller,
              obscureText: false, 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "SFProDisplay", 
                fontSize: 16, 
                color: Color.fromARGB(255, 45, 39, 39),
              ),
              decoration: InputDecoration(
                hintText: widget.text,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                ),
                filled: true,
                fillColor: Colors.transparent, 
                border: InputBorder.none, 
              ),
            ),
          ]
        ),
      ),
    );
  }
}
