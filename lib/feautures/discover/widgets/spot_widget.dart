import 'package:flutter/material.dart';

class SpotWidget extends StatelessWidget {
  const SpotWidget({
    super.key, required this.text, required this.picture
  });

  final String text;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            picture,
            height: 130,
            fit: BoxFit.cover,
            width: 180,
          ),
        ),
        Container(
          width: 180,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
          ),
        ),
      ],
    );
  }
}
