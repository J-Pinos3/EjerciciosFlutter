import '../../domain/entities/entities.dart';
import '../../domain/datasources/recipes_datasources.dart';
import '../../domain/repositories/recipes_repository.dart';
import '../datasources/reciperp_datasource.dart';

class RecipesRepositoryImpl extends RecipesRepository{

  final RecipesDataSource dataSource;

  RecipesRepositoryImpl(this.dataSource);
  
  @override
  Future<List<FullRecipe>> getRandomMeals(String recipeName) {
    return dataSource.getRandomMeals(recipeName);
  }

}