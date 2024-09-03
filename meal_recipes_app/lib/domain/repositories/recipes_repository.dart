import '../entities/entities.dart';

abstract class RecipesRepository{

  Future<List<FullRecipe>> getRandomMeals(String recipeName);
}