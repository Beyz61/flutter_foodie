import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/database_repository.dart';
import 'package:foodie_screen/feautures/discover/widgets/category_widget.dart';
import 'package:foodie_screen/feautures/discover/widgets/spot_widget.dart';
import 'package:foodie_screen/feautures/feed/models/food_data.dart';
import 'package:foodie_screen/feautures/feed/screens/recipe_screen.dart';
import 'package:foodie_screen/shared/widgets/search_button.dart';
import 'package:provider/provider.dart';

class SpotScreen extends StatelessWidget {
  const SpotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const CategoryWidget(),
              const SizedBox(height: 10),
              const Divider(
                thickness: 0.6,
                height: 20,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 255, 252, 247),
              ),
              const SizedBox(height: 10),
              const Text(
                "Aktuell beliebte Rezepte",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: FutureBuilder(
                  future: context.read<DatabaseRepository>().getPopularRecipes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final random = Random();
                      final allRecipes = [...recipes];
                      allRecipes.shuffle(random);
                      final selectedRecipes = allRecipes.take(4).toList();

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
                                      builder: (context) => RecipeScreen(recipe: selectedRecipes[0]),
                                    ),
                                  );
                                },
                                child: SpotWidget(
                                  text: selectedRecipes[0].recipeName,
                                  picture: selectedRecipes[0].imagePath,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeScreen(recipe: selectedRecipes[1]),
                                    ),
                                  );
                                },
                                child: SpotWidget(
                                  text: selectedRecipes[1].recipeName,
                                  picture: selectedRecipes[1].imagePath,
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
                                      builder: (context) => RecipeScreen(recipe: selectedRecipes[2]),
                                    ),
                                  );
                                },
                                child: SpotWidget(
                                  text: selectedRecipes[2].recipeName,
                                  picture: selectedRecipes[2].imagePath,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeScreen(recipe: selectedRecipes[3]),
                                    ),
                                  );
                                },
                                child: SpotWidget(
                                  text: selectedRecipes[3].recipeName,
                                  picture: selectedRecipes[3].imagePath,
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
