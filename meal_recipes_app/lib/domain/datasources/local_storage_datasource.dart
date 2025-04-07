import '../entities/full_recipe.dart';

abstract class LocalStorageDatasource{
  Future<void> toggleFavorite(FullRecipe fullRecipe);

  Future<bool> isRecipeFavorite(String idMeal);

  Future<List<FullRecipe>> loadRecipes({int limit = 10, int offset = 0});
}