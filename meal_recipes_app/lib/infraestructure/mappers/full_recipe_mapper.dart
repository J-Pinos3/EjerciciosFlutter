import '../models/models.dart';
import '../../domain/entities/entities.dart';

class FullRecipeMapper{

  static FullRecipe fullRecipeDbtoEntity(FullRecipeDb fullRecipeDb) => FullRecipe(
    dateModified: fullRecipeDb.dateModified, idMeal: fullRecipeDb.idMeal, strArea: fullRecipeDb.strArea,
    strCategory: fullRecipeDb.strCategory, strCreativeCommonsConfirmed: fullRecipeDb.strCreativeCommonsConfirmed,
    strDrinkAlternate: fullRecipeDb.strDrinkAlternate, strImageSource: fullRecipeDb.strImageSource, strIngredient1: fullRecipeDb.strIngredient1,
    strIngredient10: fullRecipeDb.strIngredient10, strIngredient11: fullRecipeDb.strIngredient11, strIngredient12: fullRecipeDb.strIngredient12,
    strIngredient13: fullRecipeDb.strIngredient13, strIngredient14: fullRecipeDb.strIngredient14, strIngredient15: fullRecipeDb.strIngredient15,
    strIngredient16: fullRecipeDb.strIngredient16, strIngredient17: fullRecipeDb.strIngredient17, strIngredient18: fullRecipeDb.strIngredient18,
    strIngredient19: fullRecipeDb.strIngredient19, strIngredient2: fullRecipeDb.strIngredient2, strIngredient20: fullRecipeDb.strIngredient20,
    strIngredient3: fullRecipeDb.strIngredient3, strIngredient4: fullRecipeDb.strIngredient4, strIngredient5: fullRecipeDb.strIngredient5,
    strIngredient6: fullRecipeDb.strIngredient6, strIngredient7: fullRecipeDb.strIngredient7, strIngredient8: fullRecipeDb.strIngredient8,
    strIngredient9: fullRecipeDb.strIngredient9, strInstructions: fullRecipeDb.strInstructions, strMeal: fullRecipeDb.strMeal,
    strMealThumb: fullRecipeDb.strMealThumb, strMeasure1: fullRecipeDb.strMeasure1, strMeasure10: fullRecipeDb.strMeasure10, strMeasure11: fullRecipeDb.strMeasure11,
    strMeasure12: fullRecipeDb.strMeasure12, strMeasure13: fullRecipeDb.strMeasure13, strMeasure14: fullRecipeDb.strMeasure14,
    strMeasure15: fullRecipeDb.strMeasure15, strMeasure16: fullRecipeDb.strMeasure16, strMeasure17: fullRecipeDb.strMeasure17,
    strMeasure18: fullRecipeDb.strMeasure18, strMeasure19: fullRecipeDb.strMeasure19, strMeasure2: fullRecipeDb.strMeasure2,
    strMeasure20: fullRecipeDb.strMeasure20, strMeasure3: fullRecipeDb.strMeasure3, strMeasure4: fullRecipeDb.strMeasure4, strMeasure5: fullRecipeDb.strMeasure5,
    strMeasure6: fullRecipeDb.strMeasure6, strMeasure7: fullRecipeDb.strMeasure7, strMeasure8: fullRecipeDb.strMeasure8, strMeasure9: fullRecipeDb.strMeasure9,
    strSource: fullRecipeDb.strSource, strTags: fullRecipeDb.strTags, strYoutube: fullRecipeDb.strYoutube);

}