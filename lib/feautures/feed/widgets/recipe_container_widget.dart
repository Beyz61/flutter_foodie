import 'dart:ui';

import 'package:flutter/material.dart';
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
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5), // Schwarzer, leicht durchsichtiger Hintergrund
            border: Border.all(color: Colors.white, width: 0.1), // Weiße Umrandung
            borderRadius: BorderRadius.circular(16), // Runder Rahmen    
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                    decoration: TextDecoration.underline, 
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
                const SizedBox(height: 16),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        recipe.getIngredientsUnitText(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 252, 249),
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
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
                            fontSize: 18,
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
