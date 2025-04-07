

import 'package:meal_recipes_app/domain/entities/entities.dart';
import 'package:meal_recipes_app/infraestructure/models/models.dart';

class ShortRecipeMapper{
  static ShortRecipe shortRecipeDbToEntity(ShortRecipeDB shortRecipeDb) => ShortRecipe(
    idMeal: shortRecipeDb.idMeal,
    strMeal: shortRecipeDb.strMeal,
    strMealThumb: shortRecipeDb.strMealThumb);
}