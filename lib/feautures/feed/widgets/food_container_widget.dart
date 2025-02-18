import 'package:flutter/material.dart';
import 'package:foodie_screen/config/colors.dart';
import 'package:foodie_screen/data/repository/recipe/shared_preferences_recipe_repository.dart';
import 'package:foodie_screen/feautures/feed/models/fav_dialog.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';
import 'package:provider/provider.dart';

class FoodContainerWidget extends StatefulWidget {
  final Function()? onTap;
  final Recipe foodRecipe;
  final String collectionName;

  const FoodContainerWidget({
    super.key,
    required this.onTap,
    required this.foodRecipe,
    required this.collectionName
  });

  @override
  _FoodContainerWidgetState createState() => _FoodContainerWidgetState();
}

class _FoodContainerWidgetState extends State<FoodContainerWidget> {


 

  @override
  Widget build(BuildContext context) {

    final sharedProvider = Provider.of<SharedPreferencesRecipeRepository>(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            height: 94,
            decoration: BoxDecoration(
              color:blackWithOpacity,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: blackWithOpacity,
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 85,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(widget.foodRecipe.imagePath),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:blackWithOpacity,
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.foodRecipe.recipeName,
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: "SFProDisplay",
                                  color: Color.fromARGB(255, 255, 249, 249),
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3,
                                      color: Colors.black,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Consumer<SharedPreferencesRecipeRepository>(
                              builder: (context, state , _){

                                bool isFavorite = state.getFavoriteState(widget.collectionName, widget.foodRecipe.recipeName);
                                return IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 25,
                                color: const Color.fromARGB(255, 236, 107, 8),
                              ),
                              onPressed: () {
                                if (isFavorite) {
                                  FavDialog.showRemoveFromCollectionDialog(
                                      context,  widget.collectionName,widget.foodRecipe.recipeName,
                                      () {
                                       
                                  });
                                } else {
                                  FavDialog.showAddToCollectionDialog(
                                      context, widget.foodRecipe.recipeName,
                                      () {
                               
                                  });
                                }
                              },
                            );
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.schedule,
                              size: 18.5,
                              color: Color.fromARGB(2255, 255, 252, 247),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.foodRecipe.preparationTime,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 252, 247),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.5,
                                fontStyle: FontStyle.italic,
                                fontFamily: "SFProDisplay",
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "${widget.foodRecipe.portionAmount} / ${widget.foodRecipe.price.toStringAsFixed(2)}€",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 252, 247),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.5,
                                fontStyle: FontStyle.italic,
                                fontFamily: "SFProDisplay",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
