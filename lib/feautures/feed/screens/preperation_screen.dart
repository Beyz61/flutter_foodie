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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Zubereitung:",
                  style: TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontFamily: "SFProDisplay",
                      decoration: TextDecoration.underline, 
                      decorationColor:Color.fromARGB(255, 246, 246, 246),
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Color.fromARGB(255, 203, 197, 191),
                        offset: Offset(1, 1),

                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context,index) => const SizedBox(height: 0,),
                itemCount: recipe.preparations.length,
                itemBuilder: (context, index) {
                  final preparation = recipe.preparations[index];
                     return  PreparationContainer(
                title: preparation.title,
                description: recipe.buildPreparationTexts(preparation),
              );
                },
              ),
             
              const SizedBox(height: 20),
              if(recipe.tipp != null)
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
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
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          recipe.tipp!,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 13, 13, 13),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            fontFamily: "SFProDisplay",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                " Guten\nAppetit!",
                style: TextStyle(
                  fontSize: 70,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w700, // Make the text bolder
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
    );
  }
}
