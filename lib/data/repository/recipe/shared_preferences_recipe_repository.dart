import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:foodie_screen/data/repository/recipe/recipe_repository.dart';
import 'package:foodie_screen/feautures/favorite/models/fav_collection_item.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// KLASSE -> STATE DURCH CHANGE NOTIFIER
class SharedPreferencesRecipeRepository extends ChangeNotifier
    implements RecipeRepository {
  static const String _favCollectionsKey = 'favCollections';

  SharedPreferences? prefs;

  bool get hasInit => prefs != null;

  final List<FavCollection> favCollections = [];

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> _saveCollection() async {
    List<String> encodedCollections = favCollections.map((collection) {
      return jsonEncode({
        "collectionName": collection.collectionName,
        "recipes": collection.recipes,
      });
    }).toList();
    await prefs!.setStringList(_favCollectionsKey, encodedCollections);
  }

  @override
  Future<void> addCollection(String collectionName, String? recipeName) async {
    if (!hasInit) {
      throw Exception(
          "Please init SharedPreferencesRecipeRepository init() first");
    }
    favCollections.add(FavCollection(
        collectionName: collectionName,
        recipes: recipeName != null ? [recipeName] : []));
    await _saveCollection();
    notifyListeners();
  }

  @override
  Future<void> deleteCollection(String collectionName) async {
    if (!hasInit) {
      throw Exception(
          "Please init SharedPreferencesRecipeRepository init() first");
    }
    int index = favCollections.indexWhere((collection) =>
        collection.collectionName.toLowerCase() ==
        collectionName.toLowerCase());
    favCollections.removeAt(index);
    await _saveCollection();
    notifyListeners();
  }

  @override
  Future<void> getAllCollections() async {
    if (!hasInit) {
      throw Exception(
          "Please init SharedPreferencesRecipeRepository init() first");
    }
    List<String>? encodedCollections = prefs!.getStringList(_favCollectionsKey);
    if (encodedCollections != null) {
      final collections = encodedCollections.map((encodedCollection) {
        Map<String, dynamic> collectionMap = jsonDecode(encodedCollection);
        return FavCollection(
          collectionName: collectionMap["collectionName"],
          recipes: List<String>.from(collectionMap["recipes"]),
        );
      }).toList();
      favCollections.clear();
      favCollections.addAll(collections);
    }
    notifyListeners();
  }
  
  @override
  bool getFavoriteState(String collectionName, String recipeName) {
    final collection = favCollections.firstWhereOrNull((coll) => coll.collectionName.toLowerCase() == collectionName.toLowerCase());
    if(collection == null){
      return false;
    }
    final recipe = collection.recipes.firstWhereOrNull((r) => r.toLowerCase() == recipeName.toLowerCase());
    return recipe != null;
  }
  
  @override
  Future<void> addRecipeToCollection(String collectionName, String recipeName)async  {
    final collection = favCollections.firstWhereOrNull((coll) => coll.collectionName.toLowerCase() == collectionName.toLowerCase());
    if(collection != null){
        collection.recipes.add(recipeName);
    }
    await _saveCollection();
    notifyListeners();
  }
  
  @override
  Future<void> removeRecipeFromCollection(String collectionName, String recipeName) async {
    final collection = favCollections.firstWhereOrNull((coll) => coll.collectionName.toLowerCase() == collectionName.toLowerCase());
    print("Trying remocing recipe from collection: $collectionName -> $recipeName");
    if(collection != null){
        collection.recipes.remove(recipeName);
        print("Removed Recipe!");
    }
    await _saveCollection();
    notifyListeners();
  }
  
  @override
  String? getCollectionNameFromRecipe(String recipeName) {
    for(FavCollection collection in favCollections){
      if(collection.recipes.contains(recipeName)){
        return collection.collectionName;
      }
    }
    return null;
  }
  
  @override
  Future<void> changeCollectionName(String oldCollectionName, String newCollectionName) async {
    final collection = favCollections.firstWhereOrNull((coll) => coll.collectionName.toLowerCase() == oldCollectionName.toLowerCase());
    if(collection != null){
        collection.collectionName = newCollectionName;
    }
    await _saveCollection();
    notifyListeners();
  }
}
