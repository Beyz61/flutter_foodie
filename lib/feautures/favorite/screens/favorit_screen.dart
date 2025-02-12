import 'dart:math'; // Add this import for random selection

import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/shared_preferences_database.dart';
import 'package:foodie_screen/feautures/favorite/models/fav_collection_item.dart';
import 'package:foodie_screen/feautures/favorite/models/new_collection_dialog.dart';
import 'package:foodie_screen/feautures/favorite/widgets/fav_container_widget.dart';
import 'package:foodie_screen/feautures/favorite/widgets/fav_containers_list.dart';
import 'package:foodie_screen/feautures/favorite/widgets/recipe_list_dialog.dart';
import 'package:foodie_screen/feautures/feed/logic/recipe_service.dart';
import 'package:foodie_screen/shared/widgets/fav_button.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  String? lastUsedImage;

  @override
  void initState() {
    super.initState();
    _loadFavCollections();
  }

  Future<void> _loadFavCollections() async {
    List<FavCollection> loadedCollections = await SharedPreferencesHelper.loadFavCollections();
    setState(() {
      favCollectionsList = loadedCollections;
    });
    print("collections:${loadedCollections.length}");
  }

  void _addNewCollection() {
    setState(() {});
    SharedPreferencesHelper.saveFavCollections(favCollectionsList);
  }

  void _deleteCollection(int index) {
    setState(() {
      favCollectionsList.removeAt(index);
    });
    SharedPreferencesHelper.saveFavCollections(favCollectionsList);
  }

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
              // SearchButton(
              //   text: "Was möchtest du heute kochen?",
              //   onChanged: (value) {
                
              //   },
              // ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: FavButton(
                      text: "Neue Kollektion",
                      onPressed: () {
                        showNewCollection(context, _addNewCollection); 
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 370,
                  padding: const EdgeInsets.all(16), 
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(15, 0, 0, 0).withOpacity(0.6), 
                    borderRadius: BorderRadius.circular(20), 
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), 
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.zero, 
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, 
                            crossAxisSpacing: 8.0, 
                            mainAxisSpacing: 8.0, 
                          ),
                          itemCount: favCollectionsList.length,
                          itemBuilder: (context, index) {
                            final favContainer = favCollectionsList[index];
                            
                            // Wenn es bereits eintrage in der liste giebt
                             print(favContainer.recipes);
                            if (favContainer.recipes.isNotEmpty){
                             
                            final firstRecipe= RecipeService().getByName(favContainer.recipes.last);
                            
                            return DisplayFavContainer(
                              onTap: () {
                                showRecipeListDialog(context, favContainer);
                              },
                              picture: firstRecipe.imagePath,
                             
                              text: favContainer.collectionName,
                              onDelete: () {
                                _deleteCollection(index);
                              },
                            );}
                            // Wenn die liste noch leer ist
                            else {
                              // Randomly select an image that is not the last used one
                              final random = Random();
                              final images = [
                                'assets/images/lustig.png',
                                'assets/images/hunger.png',
                                'assets/images/hungerpommes.png'
                                "assets/images/keine_rezepte.png",
                                "assets/images/keine_rezepte1.png",
                              ];
                              String randomImage;
                              do {
                                randomImage = images[random.nextInt(images.length)];
                              } while (randomImage == lastUsedImage);
                              lastUsedImage = randomImage;

                              return DisplayFavContainer(
                                onTap: () {
                                  // Handle tap
                                },
                                picture: randomImage,
                                text: "Leere Küche!",
                                onDelete: () {
                                  _deleteCollection(index);
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}