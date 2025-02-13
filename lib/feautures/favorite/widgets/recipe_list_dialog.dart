import 'package:flutter/material.dart';
import 'package:foodie_screen/data/repository/shared_preferences_database.dart';
import 'package:foodie_screen/feautures/favorite/models/fav_collection_item.dart';
import 'package:foodie_screen/feautures/favorite/widgets/fav_containers_list.dart';
import 'package:foodie_screen/feautures/feed/models/food_data.dart';
import 'package:foodie_screen/feautures/feed/screens/recipe_screen.dart';

void showRecipeListDialog(BuildContext context, FavCollection collection) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 14, 13, 13).withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.white, width: 1), 
        ),
        title: Text(
          collection.collectionName,
          style: const TextStyle(color: Colors.white),
        ),
        content: SizedBox(
          height: 300,
          width: 250, 
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: collection.recipes.map((recipeName) {
                final recipe = recipes.firstWhere((recipe) => recipe.recipeName == recipeName);
                return ListTile(
                  leading: Image.asset(recipe.imagePath, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(
                    recipe.recipeName,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    overflow: TextOverflow.ellipsis, 
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      collection.recipes.remove(recipeName);
                      await SharedPreferencesHelper.saveFavCollections(favCollectionsList);
                      Navigator.of(context).pop();
                      showRecipeListDialog(context, collection);
                    },
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
          ),
        ),
      );
    },
  );
}
