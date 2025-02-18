import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.text,
    required this.onChanged,
  });

  final String text;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 24, 23, 22),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white, width: 1), 
          boxShadow: [
            BoxShadow(
              color: blackWithOpacity,
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: TextField(
          obscureText: false,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: "SFProDisplay",
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 242, 101, 8), 
          ),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "SFProDisplay",
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 246, 191, 143), 
            ),
            filled: true,
            fillColor: Colors.transparent,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.search,
                color: Color.fromARGB(255, 246, 191, 143), 
              ),
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}