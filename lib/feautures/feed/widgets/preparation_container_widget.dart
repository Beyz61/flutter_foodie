import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class PreparationContainer extends StatelessWidget {
  final String title;
  final String description;

  const PreparationContainer({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
           margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: lightdarkblackWithOpacity,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 252, 249),
                  fontWeight: FontWeight.w700,
                  fontSize: 28, 
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                  decorationColor: Color.fromARGB(255, 225, 218, 211),
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 252, 249),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
