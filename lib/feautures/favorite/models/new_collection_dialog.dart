import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/favorite/models/fav_collection_item.dart';
import 'package:foodie_screen/feautures/favorite/widgets/fav_containers_list.dart';

void showNewCollection(BuildContext context, Function onCollectionAdded) {
  final TextEditingController controller = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 237, 226, 193),
        title: const Text(
          "Neue Kollektion erstellen",
          style: TextStyle(
            color: Color.fromARGB(255, 56, 41, 36),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
          ),
        ),
        content: TextField(
          controller: controller,
          style: const TextStyle(
            color: Color.fromARGB(255, 56, 41, 36), 
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            fontFamily: "SFProDisplay",
          ),
          decoration: const InputDecoration(
            hintText: "Kollektion Name",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 56, 41, 36),
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
            child: const Icon(
              Icons.close,
              color: Color.fromARGB(255, 56, 41, 36),
              size: 30,
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
            child: const Icon(
              Icons.check,
              color: Color.fromARGB(255, 56, 41, 36),
              size: 30,
            ),
          ),
        ],
      );
    },
  );
}