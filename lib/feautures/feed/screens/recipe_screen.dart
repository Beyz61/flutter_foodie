import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/recipe/shared_preferences_recipe_repository.dart';
import 'package:foodie_screen/feautures/feed/models/fav_dialog.dart';
import 'package:foodie_screen/feautures/feed/models/portion_counter.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';
import 'package:foodie_screen/feautures/feed/screens/preperation_screen.dart';
import 'package:foodie_screen/feautures/feed/widgets/recipe_container_widget.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeScreen({super.key, required this.recipe});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    final sharedProvider = Provider.of<SharedPreferencesRecipeRepository>(context, listen: false);
    isFavorite = sharedProvider.getFavoriteState('default', widget.recipe.recipeName);
  }

  void _addToFavorites() {
    final sharedProvider = Provider.of<SharedPreferencesRecipeRepository>(context, listen: false);
    if (isFavorite) {
      FavDialog.showRemoveFromCollectionDialog(context, 'default', widget.recipe.recipeName, () {
        setState(() {
          isFavorite = false;
        });
      });
    } else {
      FavDialog.showAddToCollectionDialog(context, widget.recipe.recipeName, () {
        setState(() {
          isFavorite = true;
        });
      });
    }
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
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                ),   
                Container(
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                    color: lightdarkblackWithOpacity,
                    offset: const Offset(0, 1),
                    blurRadius: 3,
                    ),
                  ],
                  ),
                  child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? const Color.fromARGB(255, 236, 107, 8) : const Color.fromARGB(255, 255, 255, 255),
                    size: 25,
                    shadows: const [
                    Shadow(
                      offset: Offset(0, 0),
                      blurRadius: 8,
                      color: Color.fromARGB(255, 34, 21, 4),
                    ),
                    ],
                  ),
                  onPressed: _addToFavorites,
                  ),
                ),
                const SizedBox(height: 10),
                IngredientsContainer(recipe: widget.recipe,),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 2,
                  color: Color.fromARGB(255, 251, 248, 248),
                  height: 1,
                ),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: darkblackWithOpacity,
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                PortionCounter(recipe: widget.recipe, callback: () => setState(() {})),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: darkblackWithOpacity, 
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: blackWithOpacity,
                          offset: const Offset(4, 4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: witheWithOpacity,
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
                const SizedBox(height: 60,)
              ],
            ),
          ),
        ),
      )
    );
  }
}