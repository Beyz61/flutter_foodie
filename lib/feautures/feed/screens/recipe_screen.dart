import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/feautures/feed/models/portion_counter.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';
import 'package:foodie_screen/feautures/feed/screens/preperation_screen.dart';
import 'package:foodie_screen/feautures/feed/widgets/recipe_container_widget.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeScreen({super.key, required this.recipe});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: screenSize.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ 
            backroundColor2,
            backroundColor1
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 20, left: 20), 
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.recipe.recipeName, 
                  textAlign: TextAlign.center,
                  style: const TextStyle(         
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontFamily: "SFProDisplay",
                        color: Color.fromARGB(255, 255, 252, 249),
                        shadows:[
                            Shadow(
                            blurRadius: 1,
                            color: Color.fromARGB(255, 255, 252, 249),
                            offset: Offset(0, 1)
                            ),
                        ],
                       ), 
                      ),   
                const SizedBox(height: 20),
                 IngredientsContainer(recipe: widget.recipe,),
                const SizedBox(height: 30),
                const Divider( thickness: 0.7, 
                      color: Color.fromARGB(255, 0, 0, 0)),
                const Text( " Portion", style: TextStyle(  fontSize: 36,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        fontFamily: "SFProDisplay",
                        color: Color.fromARGB(255, 255, 252, 249),
                        shadows:[
                          Shadow(
                            blurRadius: 4,
                            color: Color.fromARGB(255, 255, 252, 249),
                   ),
                 ],
                ),
               ),
               const SizedBox(height: 10),
               PortionCounter(recipe: widget.recipe, callback: () => setState(() {
                 
               })),
                const SizedBox(height: 20),
                      GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  PreparationScreen(recipe: widget.recipe
                        ),
                      ),
                    );
                  },
                    child: const Center(
                      child: Text( " Zu der Zubereitung", style: TextStyle( 
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        fontFamily: "SFProDisplay",
                        color: Color.fromARGB(2255, 255, 252, 249),
                        decoration: TextDecoration.underline, 
                        decorationColor:Color.fromARGB(255, 227, 206, 188),
                     ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
   


// scaffoldBackgroundColor: Colors.transparent,
//           fontFamily: "SFProDisplay");