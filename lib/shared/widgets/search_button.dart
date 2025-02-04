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
          color: searchButtonColor1,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
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
            color: Colors.black54, 
          ),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "SFProDisplay",
              fontStyle: FontStyle.italic,
              color: Colors.black54, 
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
                color: Colors.black54, 
              ),
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}