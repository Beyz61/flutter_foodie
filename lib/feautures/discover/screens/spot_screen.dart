import "package:flutter/material.dart";
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/database_repository.dart';
import 'package:foodie_screen/feautures/discover/widgets/category_widget.dart';
import 'package:foodie_screen/feautures/discover/widgets/spot_widget.dart';
import 'package:foodie_screen/feautures/feed/models/food_data.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';
import 'package:foodie_screen/feautures/feed/screens/recipe_screen.dart';
import 'package:foodie_screen/shared/widgets/search_button.dart';
import 'package:provider/provider.dart';

class SpotScreen extends StatefulWidget {
  const SpotScreen({super.key});

  @override
  _SpotScreenState createState() => _SpotScreenState();
}

class _SpotScreenState extends State<SpotScreen> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [backroundColor2, backroundColor1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SearchButton(text: "Was möchtest du heute kochen?"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Top Kategorien",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      fontFamily: "SFProDisplay",
                    ),
                  ),
                  SizedBox(width: 150),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 0.6,
                height: 20,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 255, 252, 247),
              ),
              const SizedBox(height: 10),
              CategoryWidget(
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                selectedCategory: selectedCategory,
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 0.6,
                height: 20,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 255, 252, 247),
              ),
              const SizedBox(height: 10),
              Text(
                selectedCategory ?? "Aktuell beliebte Rezepte",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: FutureBuilder<List<Recipe>>(
                  future: selectedCategory == null
                      ? context.read<DatabaseRepository>().getAllRecipes()
                      : Future.value(recipes.where((
                        recipe) => recipe.category.toLowerCase(

                        ) 
                        == selectedCategory!.toLowerCase()).toList()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("Keine Rezepte gefunden"),
                      );
                    } else {
                      final recipeList = snapshot.data!;
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeScreen(recipe: recipeList[0]),
                                    ),
                                  );
                                },
                                child: SpotWidget(
                                  text: recipeList[0].recipeName,
                                  picture: recipeList[0].imagePath,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeScreen(recipe: recipeList[1]),
                                    ),
                                  );
                                },
                                child: SpotWidget(
                                  text: recipeList[1].recipeName,
                                  picture: recipeList[1].imagePath,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeScreen(recipe: recipeList[2]),
                                    ),
                                  );
                                },
                                child: SpotWidget(
                                  text: recipeList[2].recipeName,
                                  picture: recipeList[2].imagePath,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeScreen(
                                        recipe: recipeList[3]),
                                    ),
                                  );
                                },
                                child: SpotWidget(
                                  text: recipeList[3].recipeName,
                                  picture: recipeList[3].imagePath,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
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
