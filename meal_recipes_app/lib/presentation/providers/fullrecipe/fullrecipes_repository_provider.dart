import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes_app/infraestructure/datasources/reciperp_datasource.dart';
import 'package:meal_recipes_app/infraestructure/repositories/recipes_repository_impl.dart';


final recipesRepositoryProvicer = Provider((ref){
  return RecipesRepositoryImpl( RecipeRPDatasource() );
});
