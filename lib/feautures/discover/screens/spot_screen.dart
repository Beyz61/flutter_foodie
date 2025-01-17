import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/database_repository.dart';
import 'package:foodie_screen/feautures/discover/widgets/category_widget.dart';
import 'package:foodie_screen/feautures/discover/widgets/spot_widget.dart';
import 'package:foodie_screen/shared/widgets/search_button.dart';
import 'package:provider/provider.dart';

class SpotScreen extends StatelessWidget {
  const SpotScreen({super.key, });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backroundColor2,
              backroundColor1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SearchButton(text: "Was möchtest du heute kochen?"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Top Kategorien",
                   style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                    ),
                  ),
                  SizedBox(width: 150), 
                  // Icon(Icons.tune, size: 26, color: Colors.white),                       
                ],
              ),
                     const SizedBox(height: 10),
                      const Divider(
                      thickness: 0.6,
                      height: 20,
                      indent: 20,
                       endIndent: 20,
                      color: Color.fromARGB(255, 255, 252, 247),),
                      const SizedBox(height: 10),
              
              const CategoryWidget(),
              const SizedBox(height: 10),
              const Divider(
              thickness: 0.6,
              height: 20,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 255, 252, 247),),
               const SizedBox(height: 10), 
               const Text(
                 "Aktuell beliebte Rezepte",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 24,
                  fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      fontFamily: "SFProDisplay",

                 ),
               ),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   FutureBuilder(
            future: context.read<DatabaseRepository>().getPopularRecipes(), // Beliebte Rezepte laden
            builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) { // Ladeanzeige 
            return  const Center(
            child: 
            //Platform.isAndroid // damit es sich dem Handy anpasst
             CircularProgressIndicator()
           // : const CupertinoActivityIndicator(
          // ),
          );
         } else { // rezepte gefunden
      final popularRecipes = snapshot.data as List<SpotWidget>; // Beliebte Rezepte
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              popularRecipes[0],
              const SizedBox(width: 10),
              popularRecipes[1],
               ],
               ),
                 const SizedBox(height: 20),
                 Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  popularRecipes[2],
                  const SizedBox(width: 10),
                  popularRecipes[3],
                 ],
                 ),
                ],
                );
               }
              },
            ),
           ],
          ),
         ),
       ],
       ),
      ),
     ),
   );
 }
}
