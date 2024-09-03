import '../entities/entities.dart';

abstract class RecipesDataSource{

  Future<List<FullRecipe>> getRandomMeals(String recipeName);
}