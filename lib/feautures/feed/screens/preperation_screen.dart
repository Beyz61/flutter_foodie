import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';
import 'package:foodie_screen/feautures/feed/widgets/preparation_container_widget.dart';

class PreparationScreen extends StatelessWidget {
  final Recipe recipe;
  const PreparationScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70),
                const Text(
                  "Zubereitung:",
                  style: TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontFamily: "SFProDisplay",
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recipe.preparations.length,
                  itemBuilder: (context, index) {
                    final preparation = recipe.preparations[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: PreparationContainer(
                        title: preparation.title,
                        description: recipe.buildPreparationTexts(preparation),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                if (recipe.tipp != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tipp: ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              fontFamily: "SFProDisplay",
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 203, 20, 20),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            recipe.tipp!,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 13, 13, 13),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              fontFamily: "SFProDisplay",
                              shadows: [
                                Shadow(
                                  blurRadius: 0.5,
                                  color: Colors.black,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                const Text(
                  " Guten\nAppetit!",
                  style: TextStyle(
                    fontSize: 70,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontFamily: "SFProDisplay",
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
