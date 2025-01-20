import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/favorite/models/fav_collection_item.dart';
import 'package:foodie_screen/feautures/feed/models/food_data.dart';
import 'package:foodie_screen/feautures/feed/screens/recipe_screen.dart';

void showRecipeListDialog(BuildContext context, FavCollection collection) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black.withOpacity(0.8),
        title: Text(
          collection.collectionName,
          style: const TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: collection.recipes.map((recipeName) {
            final recipe = recipes.firstWhere((recipe) => recipe.recipeName == recipeName);
            return ListTile(
              leading: Image.asset(recipe.imagePath, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(
                recipe.recipeName,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeScreen(recipe: recipe),
                  ),
                );
              },
            );
          }).toList(),
        ),
      );
    },
  );
}
