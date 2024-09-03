import 'package:dio/dio.dart';
import 'package:meal_recipes_app/infraestructure/models/fullrecipe_response.dart';
import '../../domain/entities/entities.dart';
import '../mappers/mappers.dart';
import '../../domain/datasources/recipes_datasources.dart';

class RecipeRPDatasource extends RecipesDataSource{

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://www.themealdb.com/api/json/v1/1"
    )
  );

  List<FullRecipe> _jsonFullRecipeToMovie( Map<String, dynamic> json ){
    final fullRecipeResponse = FullRecipeResponse.fromJson(json);

    final List<FullRecipe> fullRecipes = fullRecipeResponse.meals
    .map((fullRecipeDb) => FullRecipeMapper.fullRecipeDbtoEntity(fullRecipeDb)).toList();
    
    return fullRecipes;
  }

  @override
  Future<List<FullRecipe>> getRandomMeals(String recipeName) async{
    
    final response = await dio.get('/search.php',
      queryParameters: {
        's': recipeName
      });

      return _jsonFullRecipeToMovie(response.data);
  }

}