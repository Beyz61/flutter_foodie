import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class FoodieButton extends StatelessWidget {
  const FoodieButton({
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
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          backgroundColor: signInBtnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,style: const TextStyle(
                                color: Color.fromARGB(255, 45, 25, 7),
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
  

                //          TextStyle(
                //                 color: Color.fromARGB(255, 234, 220, 208),
                //  fontWeight: FontWeight.w600,
                //                 fontSize: 18,
                //                 fontStyle: FontStyle.italic,
                //                 fontFamily: "SFProDisplay",
                //               ),
                //             ),