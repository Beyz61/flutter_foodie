import 'package:foodie_screen/feautures/feed/models/food_data.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';

class RecipeService {
  Recipe getByName(String name){
    Recipe recipe =recipes.first;
    for (var element in recipes) {
      if (element.recipeName == name){
        recipe = element;
        break;
      }

    }
    return recipe;
  }
}