import 'package:flutter/material.dart';
import 'package:foodie_screen/data/repository/database_repository.dart';
import 'package:foodie_screen/data/repository/recipe/shared_preferences_recipe_repository.dart';
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
    final sharedProvider = Provider.of<SharedPreferencesRecipeRepository>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 218, 211),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 75, 67, 59),
              Color.fromARGB(255, 24, 23, 22),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 290, 
              left: 0,
              right: 0,
              child: Center(
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    "assets/icon/icon.png",
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
            Padding(
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
                      future: context.read<DatabaseRepository>().getAllRecipes(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeCap: StrokeCap.round,
                            ),
                          );
                        }
                        final recipes = (snapshot.data as List<Recipe>).where((recipe) {
                          return recipe.recipeName.toLowerCase().contains(searchQuery.toLowerCase());
                        }).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipes[index];
                            return FoodContainerWidget(
                              collectionName: sharedProvider.getCollectionNameFromRecipe(recipe.recipeName) ?? "",
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
          ],
        ),
      ),
    );
  }
}