import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/favorite/models/fav_collection_item.dart';
import 'package:foodie_screen/feautures/favorite/widgets/fav_containers_list.dart';

void showNewCollection(BuildContext context, Function onCollectionAdded) {
  final TextEditingController controller = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black.withOpacity(0.8),
        title: const Text(
          "Neue Kollektion erstellen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
          ),
        ),
        content: TextField(
          controller: controller,
          style: const TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
          ),
          decoration: const InputDecoration(
            hintText: "Kollektion Name",
            hintStyle: TextStyle(
              color: Colors.white54,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
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
            onPressed: () {
              String collectionName = controller.text; // der Name der Kollektion
              if (collectionName.isNotEmpty) {
                favCollectionsList.add(
                  FavCollection(
                    collectionName: collectionName,
                    recipes: [], // kommt später, noch keine Rezepte
                  ),
                );
                onCollectionAdded();
              }
              Navigator.of(context).pop();
            },
            child: const Text(
              "Hinzufügen",
              style: TextStyle(
                color: Colors.white,
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