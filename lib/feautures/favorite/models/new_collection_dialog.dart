import 'package:flutter/material.dart';

void showNewCollection(BuildContext context, Function(String) onCollectionAdded) {
  final TextEditingController controller = TextEditingController();

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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white54),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
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
              String collectionName =
                  controller.text; // der Name der Kollektion
              if (collectionName.isNotEmpty) {
                onCollectionAdded(collectionName);
                print("On Collection Added");
              }
              Navigator.of(context).pop();
            },
            child: const Text(
              "Hinzufügen",
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
