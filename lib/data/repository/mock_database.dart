
import 'package:foodie_screen/feautures/discover/widgets/spot_widget.dart';
import 'package:foodie_screen/feautures/feed/models/food_data.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';

import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {

  final List<String> categories = ["Low Carb", "Veggie", "schnell", "Season"];
  final List<Map<String, List<String>>> favoriteCollections = [];
  final List<SpotWidget> popularRecipes = [
  SpotWidget(text: "Dumplings",picture: "assets/images/dumplings.png"),
  SpotWidget(text: "Baklava", picture: "assets/images/baklava.png"),
  SpotWidget(text: "Pizza Caprese", picture: "assets/images/pizza.png"),
  SpotWidget(text: "Sushi", picture: "assets/images/sushi.png"),];

   List<String> users = ["beyz", "6161"];

// @override
//   Future<void> addFavCollection(String collectionName, List<String> recipes) async {
//   await Future.delayed(const Duration(milliseconds: 1)); 
//   favCollectionsList.add(FavCollection(
//     collectionName: collectionName,
//     recipes: [],
//     image1: " ",
//     image2: " ",
//     image3: " ",
//     image4: " ",
//   ));
// }
 @override
  Future<void> removeFavCollection(String recipe) async {
    await Future.delayed(const Duration(seconds: 3)); 
  }



  @override
  Future<void> addUser(String user) async {
    await Future.delayed(const Duration(milliseconds: 1));
    // überprüfen ob user in der Liste bereits existiert
    users.add(user);
  }

  @override
  Future<void> editUser(String user) async {
    Future.delayed(const Duration(seconds: 1));
    int index = users.indexOf(user);
    if (index == -1) {
      Exception("Benutzer nicht gefunden");
    }
    users[index] = user; 
  }

  // Logindaten überprüfen
  @override
  Future<bool> checkUserCredentials(String userName, String password, String email) async {
    await Future.delayed(const Duration(seconds: 3)); 
    return users.contains(userName);
  }

  // Benutzer löschen
  @override
  Future<void> removeUser(String user) async {
    users.remove(user);
  }



  // Alle Rezepte abrufen
  @override
  Future<List<Recipe>> getAllRecipes() async {
    await Future.delayed(const Duration(seconds: 3)); 
    return  recipes;
  }


  @override
  Future<void> addFavCollection(String collectionName, List<String> recipes) async {
    await Future.delayed(const Duration(seconds: 2));
    favoriteCollections.add({collectionName: recipes});

  }

  // Rezept löschen
@override
  Future<void> removeRecipe(String recipe) async {
    await Future.delayed(const Duration(seconds: 3)); 
    recipes.remove(recipe);
  }

  // Beliebte Rezepte abrufen
  @override
  Future<List<SpotWidget>> getPopularRecipes() async {
     await Future.delayed(const Duration(seconds: 1)); 
    return popularRecipes;
  }

  // Kategorien abrufen und zurückgeben
  @override
  Future<List<String>> getCategories() async {
    await Future.delayed(const Duration(seconds: 3)); 
    return categories;
  }

  // // Kategorie abrufen und zuruckgeben
  // @override
  // Future<List<String>> getCategory(String category) async {
  //   await Future.delayed(const Duration(seconds: 3)); 
  //  return [];
  // }

  
   @override
  Future<String> PreparationContainer(String title, String description) async {
    await Future.delayed(const Duration(seconds: 1)); 
    return "Zubereitung";
  }
  
  @override
  Future<void> PortionCounter(String recipe, int newPortionSize) async{
    await Future.delayed(const Duration(seconds: 1)); 
  }
  
  @override
  Future<void> FavoritScreen(getFavoriteRecipe) async {
    await Future.delayed(const Duration(seconds: 1)); 
  }
  
  @override
  Future<void> addToFavorites(String recipe) {
 
    throw UnimplementedError();
  }
  
}