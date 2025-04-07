import 'package:meal_recipes_app/infraestructure/models/models.dart';

class ShortRecipeResponse{

  final List<ShortRecipeDB> meals;

  ShortRecipeResponse({
    required this.meals
  });

  factory ShortRecipeResponse.fromJson(Map<String, dynamic> json) => ShortRecipeResponse(
    meals: List<ShortRecipeDB>.from(json["meals"].map((x)=>ShortRecipeDB.fromJson(x)))
  );

  Map<String, dynamic> toJson() =>{
    "meals": List<dynamic>.from(meals.map((x) => x.toJson()))
  };

}