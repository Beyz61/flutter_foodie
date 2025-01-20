import 'dart:convert';
import 'dart:developer';

import 'package:foodie_screen/data/repository/database_repository.dart';
import 'package:foodie_screen/feautures/discover/widgets/spot_widget.dart';
import 'package:foodie_screen/feautures/favorite/models/fav_collection_item.dart';
import 'package:foodie_screen/feautures/feed/models/food_data.dart';
import 'package:foodie_screen/feautures/feed/models/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _favCollectionsKey = 'favCollections';

  static Future<void> saveFavCollections(List<FavCollection> collections) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedCollections = collections.map((collection) {
      return jsonEncode({
        "collectionName": collection.collectionName,
        "recipes": collection.recipes,
        "image1": collection.image1,
        "image2": collection.image2,
        "image3": collection.image3,
        "image4": collection.image4,
      });
    }).toList();
    await prefs.setStringList(_favCollectionsKey, encodedCollections);
  }

  static Future<void> removeFavCollection() async {
    await Future.delayed(const Duration(seconds: 3)); 
    log("Supii");
  }

  static Future<List<FavCollection>> loadFavCollections() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? encodedCollections = prefs.getStringList(_favCollectionsKey);
    if (encodedCollections == null) {
      return [];
    }
    return encodedCollections.map((encodedCollection) {
      Map<String, dynamic> collectionMap = jsonDecode(encodedCollection);
      return FavCollection(
        collectionName: collectionMap["collectionName"],
        recipes: List<String>.from(collectionMap["recipes"]),
        image1: collectionMap["image1"],
        image2: collectionMap["image2"],
        image3: collectionMap["image3"],
        image4: collectionMap["image4"],
      );
    }).toList();
  }
}

class SharedPreferencesDatabase implements DatabaseRepository {

 final List<String> categories = ["Low Carb", "Veggie", "schnell", "Season"];
  final List<Map<String, List<String>>> favoriteCollections = [];
  final List<SpotWidget> popularRecipes = [
  SpotWidget(text: "Dumplings",picture: "assets/images/dumplings.png"),
  SpotWidget(text: "Baklava", picture: "assets/images/baklava.png"),
  SpotWidget(text: "Pizza Caprese", picture: "assets/images/pizza.png"),
  SpotWidget(text: "Sushi", picture: "assets/images/sushi.png"),];

  
List<String> getStringList(String key) {
  return [];
}

Future<void> setStringList(String key, List<String> value) async {
}
Future<void> saveCollection(FavCollection collection) async {
  List<String> collections = getStringList("favCollections");
  collections.add(jsonEncode({
    "collectionName": collection.collectionName,
    "recipes": collection.recipes,
    "image1": collection.image1,
    "image2": collection.image2,
    "image3": collection.image3,
    "image4": collection.image4,
    }));

  @override
  Future<List<SpotWidget>> getPopularRecipes() async {
     await Future.delayed(const Duration(seconds: 1));
     return popularRecipes;
  }

}

   List<String> users = ["beyz", "6161"];


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
    return recipes;
  }


  @override
  Future<void> addFavCollection(String collectionName, List<String> recipes) async {
    await Future.delayed(const Duration(seconds: 2));

  }

  // Rezept löschen
@override
  Future<void> removeRecipe(String recipe) async {
    await Future.delayed(const Duration(seconds: 3)); 
    //foodRecipe.remove(foodRecipe);
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