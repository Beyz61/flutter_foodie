import 'package:flutter/material.dart';
import 'package:foodie_screen/data/repository/shared_preferences_database.dart';
import 'package:foodie_screen/feautures/favorite/widgets/fav_containers_list.dart';

class FavDialog {
  static void showAddToCollectionDialog(BuildContext context, String recipeName, Function onAdded) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          title: const Text(
            "Kollektion auswählen",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: favCollectionsList.map((collection) {
              return ListTile(
                title: Text(
                  collection.collectionName,
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () async {
                  collection.recipes.add(recipeName);
                  await SharedPreferencesHelper.saveFavCollections(favCollectionsList);
                  onAdded();
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  static void showRemoveFromCollectionDialog(BuildContext context, String recipeName, Function onRemoved) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          title: const Text(
            "Aus Kollektion entfernen?",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Abbrechen",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () async {
                for (var collection in favCollectionsList) {
                  collection.recipes.remove(recipeName);
                }
                await SharedPreferencesHelper.saveFavCollections(favCollectionsList);
                onRemoved();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Entfernen",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
