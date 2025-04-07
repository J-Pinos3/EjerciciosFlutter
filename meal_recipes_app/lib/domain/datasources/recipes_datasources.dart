import '../entities/entities.dart';

abstract class RecipesDataSource{

  Future<List<FullRecipe>> getRandomMeals(String recipeName);

  Future<List<ShortRecipe>> getMealsByCategory(String category);

  Future<List<FullRecipe>> searchMeals(String recipeName);

  Future<List<FullRecipe>> searchMealsById(String idMeal);
}