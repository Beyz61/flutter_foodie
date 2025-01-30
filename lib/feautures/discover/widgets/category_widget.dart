import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 2),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.fitness_center, size: 40, color: Color.fromARGB(255, 75, 70, 70)),
            ),
            const SizedBox(height: 5),
            const Text("Low Carb", style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            )),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 2),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.eco, size: 40, color: Color.fromARGB(255, 15, 138, 56)),
            ),
            const SizedBox(height: 5),
            const Text("Veggie", style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            )),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 2),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.timer, size: 40, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 5),
            const Text("Schnell", style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            )),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 2),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.wb_sunny, size: 40, color: Colors.yellow),
            ),
            const SizedBox(height: 5),
            const Text("Season", style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            )),
          ],
        ),
      ],
    );
  }
}
