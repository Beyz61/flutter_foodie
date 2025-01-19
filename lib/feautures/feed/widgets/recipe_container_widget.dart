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
      
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.1), // Weiße Umrandung
            borderRadius: BorderRadius.circular(16), // Runder Rahmen    
            image: DecorationImage(
              image: AssetImage(recipe.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.transparent.withOpacity(0.5), // Transparenz
            child:  Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Zutaten:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 252, 249),
                      fontWeight: FontWeight.w600,
                                fontSize: 28,
                                fontStyle: FontStyle.italic,
                                fontFamily: "SFProDisplay",
                                decoration: TextDecoration.underline, 
                                decorationColor:Color.fromARGB(255, 225, 218, 211),
                                shadows: [
                        Shadow(
                          blurRadius: 3,
                          color: Color.fromARGB(255, 255, 252, 249),
                          offset: Offset(0, 1)),
                      ],
                    ),    
                    ),
                const SizedBox(height: 10),
                Row(
                  children: [
                   Text(
                   recipe.getIngredientsUnitText(),
                     textAlign: TextAlign.end,
                     style: const TextStyle(
                       color: Color.fromARGB(255, 255, 252, 249),
                       fontWeight: FontWeight.w600,
                                 fontSize: 17,
                                 fontStyle: FontStyle.italic,
                                 fontFamily: "SFProDisplay",
                     ),
                   ),
                  const SizedBox( height: 340,
                    child: VerticalDivider( thickness: 1, width: 17,
                    color: Color.fromARGB(255, 255, 252, 249)),
                  ), // noch nicht fertig!!!
                 // SizedBox(height:10),
                   Flexible(
                     child: Text(
                                       recipe.getIngredientsValues(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 252, 249),
                        fontWeight: FontWeight.w500,
                                  fontSize: 16.5,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: "SFProDisplay",
                                  
                      ),
                                       ),
                   ),
                ],
              ),
             ],
            ),
            
          ),
        ),
      ),
      ),
    );
  }
}
