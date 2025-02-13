import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/feed/models/fav_dialog.dart';
import 'package:foodie_screen/feautures/feed/models/portion_counter.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';
import 'package:foodie_screen/feautures/feed/screens/preperation_screen.dart';
import 'package:foodie_screen/feautures/feed/widgets/recipe_container_widget.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeScreen({super.key, required this.recipe});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  void _addToFavorites() {
    FavDialog.showAddToCollectionDialog(context, widget.recipe.recipeName, () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: screenSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.recipe.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 70, right: 20, left: 20), 
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  widget.recipe.recipeName, 
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: "SFProDisplay",
                    shadows: [
                      Shadow(
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),   
                IconButton(
                  icon: const Icon(Icons.favorite_border,
                   color: Color.fromARGB(255, 236, 107, 8),
                   size: 30,
                  ),
                  onPressed: _addToFavorites,
                ),
                IngredientsContainer(recipe: widget.recipe,),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 0.7,
                  color: Color.fromARGB(255, 251, 248, 248),
                  height: 1,
                ),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Portion", 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: "SFProDisplay",
                    shadows: [
                      Shadow(
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                PortionCounter(recipe: widget.recipe, callback: () => setState(() {
                 
               })),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5), 
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(4, 4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          offset: const Offset(-4, -4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PreparationScreen(recipe: widget.recipe),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, 
                        shadowColor: Colors.transparent, 
                      ),
                      child: const Text(
                        "Zu der Zubereitung",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: "SFProDisplay",
                          color: Color.fromARGB(255, 245, 81, 16),
                          decorationColor: Color.fromARGB(255, 227, 206, 188),
                          shadows: [
                            Shadow(
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
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