import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class PasswordButton extends StatefulWidget {
  const PasswordButton({
    super.key,
    required this.text,
    required this.controller,
  });

  final String text;
  final TextEditingController controller;

  @override
  State<PasswordButton> createState() => _PasswordButtonState();
}

class _PasswordButtonState extends State<PasswordButton> {
  bool _isCurrentPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06,
        vertical: 10,
      ),
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
              obscureText: _isCurrentPasswordVisible,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 45, 39, 39),
                fontWeight: FontWeight.w500,
                fontSize: 15.5,
                fontStyle: FontStyle.italic,
                fontFamily: "SFProDisplay",
              ),
              decoration: InputDecoration(
                hintText: widget.text,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "SFProDisplay",
                ),
                filled: true,
                fillColor: Colors.transparent,
                border: InputBorder.none,
              ),
            ),
            Positioned(
              right: 10,
              child: IconButton(
                alignment: Alignment.center,
                icon: Icon(
                  _isCurrentPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: const Color.fromARGB(255, 45, 39, 39),
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
