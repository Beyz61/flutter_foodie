
import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';

class FoodContainerWidget extends StatelessWidget {
  final Function()? onTap;
  final Recipe foodRecipe;

  const FoodContainerWidget({
    super.key,
    required this.onTap,
    required this.foodRecipe, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), 
               borderRadius: BorderRadius.circular(10), 
              // borderRadius: BorderRadius.circular(14),
                // color: const Color.fromARGB(55, 40, 37, 37).withOpacity(0.8)
            ),
            child: Row( // Main Row
              children: [
                Padding( // Bild
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(foodRecipe.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 15 ), 
                    child: Column( // rechter Inhalt
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row( // Erste Zeile: Titel und Favoriten-Icon
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( // Title Text
                              foodRecipe.recipeName,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 252, 247),
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontFamily: "SFProDisplay",
                              ),
                            ),
                            const Icon(Icons.favorite_border, // Favoriten-Icon
                              size: 25,
                              color: Color.fromARGB(255, 255, 252, 247),
                              
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row( // Zweite Zeile: Zeit und Preis
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.schedule, // Time Icon
                              size: 18,
                              color: Color.fromARGB(2255, 255, 252, 247),

                            ),
                           const SizedBox(width: 4),                            
                            Text( // Zeit
                              foodRecipe.preparationTime,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 252, 247),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                fontFamily: "SFProDisplay",
                              ),
                            ),
                            const  Spacer(),  // abstand 
                            Text( // Preis
                              "${foodRecipe.portionAmount} / ${foodRecipe.price.toStringAsFixed(2)}€",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 252, 247),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                fontFamily: "SFProDisplay",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
         ),
      ),
     )
  );
}
}
