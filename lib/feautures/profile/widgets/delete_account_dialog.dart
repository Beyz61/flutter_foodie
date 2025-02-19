import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';

class DeleteAccountDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteAccountDialog({required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: darkblackWithOpacity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: Colors.white, width: 1),
      ),
      title: const Text(
        "Konto löschen",
        style: TextStyle(
          color: Color.fromARGB(255, 246, 191, 143),
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          fontFamily: "SFProDisplay",
        ),
      ),
      content: const Text(
        "Möchten Sie Ihr Konto wirklich löschen?",
        style: TextStyle(
          color: Color.fromARGB(255, 255, 250, 245),
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
              color: Color.fromARGB(255, 255, 108, 3),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            onDelete();
          },
          child: const Text(
            "Löschen",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 108, 3),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
          ),
        ),
      ],
    );
  }
}
