import 'package:flutter/material.dart';
import 'package:foodie_screen/data/repository/recipe/shared_preferences_recipe_repository.dart';
import 'package:foodie_screen/feautures/favorite/models/new_collection_dialog.dart';
import 'package:provider/provider.dart';

class FavDialog {
  static void showAddToCollectionDialog(
    BuildContext context,
    String recipeName,
    Function onAdded,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
          final sharedProvider = Provider.of<SharedPreferencesRecipeRepository>(context);
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.white, width: 1),
          ),
          title: const Text(
            "Kollektion auswählen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
          ),
          content: Consumer<SharedPreferencesRecipeRepository>(
            builder: (context, state, _){
              final collections = state.favCollections;
              return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...collections.map((collection){
                          
                          return ListTile(
                            title: Text(
                              collection.collectionName,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            onTap: () async {
                              sharedProvider.addRecipeToCollection(collection.collectionName, recipeName);
                              onAdded();
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            },
                          );
                      }),
                      const SizedBox(height: 10),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showNewCollection(
                              context,
                              (collectionName) async {
                                  sharedProvider.addCollection(collectionName, recipeName);
                                    onAdded();
                                  });
                        },
                        icon: const Icon(Icons.add, color: Colors.orange),
                        label: const Text(
                          "Neue Kollektion hinzufügen",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            fontFamily: "SFProDisplay",
                          ),
                        ),
                      ),
                    ],
                  );
            },
          ),
        );
      },
    );
  }

  static void showRemoveFromCollectionDialog(
    BuildContext context,
    String collectionName,
    String recipeName,
    Function onRemoved,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final sharedProvider = Provider.of<SharedPreferencesRecipeRepository>(context);
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side:
                const BorderSide(color: Colors.white, width: 1), // Thin border
          ),
          title: const Text(
            "Aus Kollektion entfernen?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Abbrechen",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                print("Collection: $collectionName");
                sharedProvider.removeRecipeFromCollection(collectionName,recipeName);
                onRemoved();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Entfernen",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
