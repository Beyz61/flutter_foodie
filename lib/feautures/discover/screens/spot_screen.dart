import 'dart:math';

import "package:flutter/material.dart";
import 'package:foodie_screen/data/repository/database_repository.dart';
import 'package:foodie_screen/feautures/discover/widgets/category_widget.dart';
import 'package:foodie_screen/feautures/discover/widgets/spot_widget.dart';
import 'package:foodie_screen/feautures/feed/models/food_data.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';
import 'package:foodie_screen/feautures/feed/screens/recipe_screen.dart';
import 'package:provider/provider.dart';

class SpotScreen extends StatefulWidget {
  const SpotScreen({super.key});

  @override
  _SpotScreenState createState() => _SpotScreenState();
}

class _SpotScreenState extends State<SpotScreen> {
  String? selectedCategory;
  late Future<List<Recipe>> _recipesFuture;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  void _loadRecipes() {
    setState(() {
      _recipesFuture = selectedCategory == null
          ? context.read<DatabaseRepository>().getAllRecipes()
          : Future.value(recipes.where((recipe) => recipe.category.toLowerCase() == selectedCategory!.toLowerCase()).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: SearchButton(text: "Was möchtest du heute kochen?"),
                  // ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 0),
                  const Text(
                    "Top Kategorien",
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
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    thickness: 2,
                    height: 20,
                    indent: 20,
                    endIndent: 20,
                    color: Color.fromARGB(255, 246, 100, 3,),
                  ),
                  const SizedBox(height: 10),
                  CategoryWidget(
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                        _loadRecipes();
                      });
                    },
                    selectedCategory: selectedCategory,
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 2,
                    height: 20,
                    indent: 20,
                    endIndent: 20,
                    color: Color.fromARGB(255, 246, 100, 3,),
                  ),
                  const SizedBox(height: 05),
                  Text(
                    selectedCategory ?? "Aktuell beliebte Rezepte",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
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
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 05),
                ],
              ),
              Expanded(
                child: FutureBuilder<List<Recipe>>(
                  future: _recipesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset("assets/icon/pizzagif.gif"),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else {
                      final recipeList =List.from(snapshot.data ?? [])..shuffle(Random());
                      // final displayList = List<Recipe>.from(recipeList);
                      // var random= Random();
                      // while (displayList.length < 4) {
                        
                      //   displayList.add(Recipe(
                      //     recipeName: "",
                      //     imagePath: "",
                      //     preparationTime: "",
                      //     portionAmount: "",
                      //     price: 0.0,
                      //     category: "",
                      //     ingredients: [],
                      //     preparations: [],
                      //     portion: 0,
                      //     tipp: null,
                      //   ));
                      // }
                      var random= Random();
                      return RefreshIndicator(
                        onRefresh: () async {
                          _loadRecipes();
                        },
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            final recipe = recipeList[index];
                            return recipe.recipeName.isEmpty
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RecipeScreen(recipe: recipe),
                                        ),
                                      );
                                    },
                                    child: SpotWidget(
                                      text: recipe.recipeName,
                                      picture: recipe.imagePath,
                                    ),
                                  );
                          },
                        ),
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
