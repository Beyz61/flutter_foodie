

abstract class RecipeRepository {
    Future<void> addCollection(String collectionName, String? recipeName);
    Future<void> deleteCollection(String collectionName);
    Future<void> getAllCollections();
    Future<void> addRecipeToCollection(String collectionName, String recipeName);
    Future<void> removeRecipeFromCollection(String collectionName, String recipeName);
    String? getCollectionNameFromRecipe(String recipeName);
    Future<void> changeCollectionName(String oldCollectionName, String newCollectionName);
    bool getFavoriteState(String collectionName, String recipeName);

}