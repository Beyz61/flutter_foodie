import 'package:flutter/material.dart';
import 'package:foodie_screen/data/repository/recipe/shared_preferences_recipe_repository.dart';
import 'package:foodie_screen/feautures/favorite/models/new_collection_dialog.dart';
import 'package:foodie_screen/feautures/favorite/widgets/fav_container_widget.dart';
import 'package:foodie_screen/feautures/favorite/widgets/recipe_list_dialog.dart';
import 'package:foodie_screen/feautures/feed/logic/recipe_service.dart';
import 'package:foodie_screen/shared/widgets/fav_button.dart';
import 'package:provider/provider.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  String? lastUsedImage;

  

  @override
  Widget build(BuildContext context) {
    final sharedProvider = Provider.of<SharedPreferencesRecipeRepository>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 218, 211),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 75, 67, 59),
              Color.fromARGB(255, 24, 23, 22),
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
                        showNewCollection(context, (collectionName) {
                          sharedProvider.addCollection(collectionName, null);
                        });
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
                  child: Stack(
                    children: [
                      Center(
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/icon/icon.png",
                            width: 250,
                            height: 250,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Consumer<SharedPreferencesRecipeRepository>(
                              builder: (context, state, _){
                                final favCollectionsList = state.favCollections;
                                return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: favCollectionsList.length,
                              itemBuilder: (context, index) {
                                final favContainer = favCollectionsList[index];

                                String? firstRecipeImagePath;

                                print(favContainer.recipes.length);

                                if (favContainer.recipes.isNotEmpty) {
                                  firstRecipeImagePath = RecipeService()
                                      .getByName(favContainer.recipes.last)
                                      .imagePath;
                                }

                                print(
                                    "Collection Name: ${favContainer.collectionName}");
                                return DisplayFavContainer(
                                  onTap: () {
                                    showRecipeListDialog(context, favContainer);
                                  },
                                  picture: firstRecipeImagePath,
                                  text: favContainer.collectionName,
                                  onDelete: () {
                                    state.deleteCollection(favContainer.collectionName);
                                   
                                  },
                                );
                              },
                            );
                              },
                            ),
                          ),
                        ],
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
