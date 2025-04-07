import '../../domain/entities/entities.dart';
import '../../domain/datasources/recipes_datasources.dart';
import '../../domain/repositories/recipes_repository.dart';

class RecipesRepositoryImpl extends RecipesRepository{

  final RecipesDataSource dataSource;

  RecipesRepositoryImpl(this.dataSource);
  
  @override
  Future<List<FullRecipe>> getRandomMeals(String recipeName) {
    return dataSource.getRandomMeals(recipeName);
  }


  @override
  Future<List<ShortRecipe>> getMealsByCategory(String category){
    return dataSource.getMealsByCategory(category);
  }

  @override
  Future<List<FullRecipe>> searchMeals(String recipeName){
    return dataSource.searchMeals(recipeName);
  }

  @override
  Future<List<FullRecipe>> searchMealsById(String idMeal){
    return dataSource.searchMealsById(idMeal);
  }

}