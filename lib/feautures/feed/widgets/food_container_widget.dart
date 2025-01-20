import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/favorite/widgets/fav_containers_list.dart';
import 'package:foodie_screen/feautures/feed/models/fav_dialog.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';

class FoodContainerWidget extends StatefulWidget {
  final Function()? onTap;
  final Recipe foodRecipe;

  const FoodContainerWidget({
    super.key,
    required this.onTap,
    required this.foodRecipe, 
  });

  @override
  _FoodContainerWidgetState createState() => _FoodContainerWidgetState();
}

class _FoodContainerWidgetState extends State<FoodContainerWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = favCollectionsList.any((collection) => collection.recipes.contains(widget.foodRecipe.recipeName));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            height: 94,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), 
              borderRadius: BorderRadius.circular(10), 
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
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 6 ), 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.foodRecipe.recipeName,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 252, 247),
                                fontWeight: FontWeight.w500,
                                fontSize: 21.5,
                                fontStyle: FontStyle.italic,
                                fontFamily: "SFProDisplay",
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 67, 65, 65),
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                size: 25,
                                color: const Color.fromARGB(255, 255, 252, 247),
                              ),
                              onPressed: () {
                                if (isFavorite) {
                                  FavDialog.showRemoveFromCollectionDialog(context, widget.foodRecipe.recipeName, () {
                                    setState(() {
                                      isFavorite = false;
                                    });
                                  });
                                } else {
                                  FavDialog.showAddToCollectionDialog(context, widget.foodRecipe.recipeName, () {
                                    setState(() {
                                      isFavorite = true;
                                    });
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.schedule,
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
