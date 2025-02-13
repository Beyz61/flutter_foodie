import 'package:flutter/material.dart';
import 'package:foodie_screen/data/repository/shared_preferences_database.dart';
import 'package:foodie_screen/feautures/favorite/models/fav_collection_item.dart';
import 'package:foodie_screen/feautures/favorite/models/new_collection_dialog.dart';
import 'package:foodie_screen/feautures/favorite/widgets/fav_containers_list.dart';

class FavDialog {
  static void showAddToCollectionDialog(
    BuildContext context,
    String recipeName,
    Function onAdded,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
          content: FutureBuilder(
            future: SharedPreferencesHelper.loadFavCollections(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Fehler: ${snapshot.error}");
              } else if (snapshot.connectionState == ConnectionState.waiting &&
                  !snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                if (snapshot.hasData) {
                  final collections = snapshot.data!;

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
                              collection.recipes.add(recipeName);
                              await SharedPreferencesHelper.saveFavCollections(
                                  favCollectionsList);
                                  
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

                                print("Here");
                                    favCollectionsList.add(FavCollection(
                                        collectionName: collectionName,
                                        recipes: [recipeName]));
                                    await SharedPreferencesHelper
                                        .saveFavCollections(favCollectionsList);

                                        print("Saved Collection");
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
                } else {
                  return const Text("Keine Kolleketionen");
                }
              }
            },
          ),
        );
      },
    );
  }

  static void showRemoveFromCollectionDialog(
    BuildContext context,
    String recipeName,
    Function onRemoved,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                for (var collection in favCollectionsList) {
                  collection.recipes.remove(recipeName);
                }
                await SharedPreferencesHelper.saveFavCollections(
                    favCollectionsList);
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
