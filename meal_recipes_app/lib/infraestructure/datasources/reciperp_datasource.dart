import 'package:dio/dio.dart';
import 'package:meal_recipes_app/infraestructure/models/models.dart';

import '../../domain/entities/entities.dart';
import '../mappers/mappers.dart';
import '../../domain/datasources/recipes_datasources.dart';

class RecipeRPDatasource extends RecipesDataSource{

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://www.themealdb.com/api/json/v1/1"
    )
  );

  List<FullRecipe> _jsonFullRecipeToMeal( Map<String, dynamic> json ){
    final fullRecipeResponse = FullRecipeResponse.fromJson(json);

    final List<FullRecipe> fullRecipes = fullRecipeResponse.meals
    .map((fullRecipeDb) => FullRecipeMapper.fullRecipeDbtoEntity(fullRecipeDb)).toList();
    
    return fullRecipes;
  }

  List<ShortRecipe> _jsonShortRecipeToMeal(Map<String, dynamic> json){
    final shortRecipeResponse = ShortRecipeResponse.fromJson(json);

    final List<ShortRecipe> shortRecipes = shortRecipeResponse.meals
    .map((shortRecipeDb) => ShortRecipeMapper.shortRecipeDbToEntity(shortRecipeDb)).toList();

    return shortRecipes;
  }

  @override
  Future<List<FullRecipe>> getRandomMeals(String recipeName) async{
    
    final response = await dio.get('/search.php',
      queryParameters: {
        's': recipeName
      });
      //print("Response.data = " + response.data["meals"].toString());
      return _jsonFullRecipeToMeal(response.data);
  }


  @override
  Future<List<ShortRecipe>> getMealsByCategory(String category) async{

    final response = await dio.get("/filter.php",
    queryParameters: {
      'c': category
    });

    return _jsonShortRecipeToMeal(response.data);
  }


  @override
  Future<List<FullRecipe>> searchMeals(String recipeName) async{
    final response = await dio.get('/search.php',
    queryParameters: {
      's': recipeName
    });

    return _jsonFullRecipeToMeal(response.data);
  }


  @override
  Future<List<FullRecipe>> searchMealsById(String idMeal) async{
    final response = await dio.get('/lookup.php',
    queryParameters: {
      'i':idMeal
    });

    return _jsonFullRecipeToMeal(response.data);
  }
}