import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';

class IngredientsContainer extends StatelessWidget {
  final Recipe recipe;
  const IngredientsContainer({
    super.key, required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15), // Runder Rahmen
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), // Verschwommenheit
        child: Container(
         width: 390, 
          decoration: BoxDecoration(
            color: lightdarkblackWithOpacity,
            border: Border.all(color: Colors.white, width: 1), 
            borderRadius: BorderRadius.circular(16),   
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Zutaten:",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 252, 249),
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    fontStyle: FontStyle.italic,
                    fontFamily: "SFProDisplay",
                  //  decoration: TextDecoration.underline, 
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
                const SizedBox(height: 5),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        recipe.getIngredientsUnitText(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 252, 249),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.5,
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
                      const VerticalDivider(
                        thickness: 1,
                        width: 17,
                        color: Color.fromARGB(255, 255, 252, 249),
                      ),
                      const SizedBox(height: 10),
                      Flexible(
                        child: Text(
                          recipe.getIngredientsValues(),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
