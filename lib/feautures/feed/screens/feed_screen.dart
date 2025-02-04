import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/database_repository.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';
import 'package:foodie_screen/feautures/feed/screens/recipe_screen.dart';
import 'package:foodie_screen/feautures/feed/widgets/food_container_widget.dart';
import 'package:foodie_screen/shared/widgets/search_button.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}
class _FeedScreenState extends State<FeedScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backroundColor2,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backroundColor2,
              backroundColor1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              SearchButton(
                text: "Was möchtest du heute kochen?",
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder(
                  future:context.read<DatabaseRepository>().getAllRecipes(),
                  builder: (context, snapshot) { // der wird aufgerufen, wenn die Daten fertig geladen sind
                    if (snapshot.connectionState == ConnectionState.waiting) { // wenn die Daten noch nicht fertig geladen sind dann wird ein Ladekreis angezeigt
                      return const Center(
                        child: CircularProgressIndicator( //
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeCap: StrokeCap.round,
                        ),
                      );
                    }
                      final recipes = (snapshot.data as List<Recipe>).where((recipe) {
                        return recipe.recipeName.toLowerCase().contains(searchQuery.toLowerCase());
                      }).toList(); // wenn die Daten fertig geladen sind dann speichern.
                      return ListView.builder(  // alle rezepte werden in einer Liste angezeigt
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          return FoodContainerWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeScreen(recipe: recipe),
                                ),
                              );
                            },
                            foodRecipe: recipes[index],
                         
                          );
                        },
                      );
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}