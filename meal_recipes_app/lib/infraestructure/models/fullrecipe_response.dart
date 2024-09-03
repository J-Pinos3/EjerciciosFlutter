import 'package:meal_recipes_app/infraestructure/models/fullrecipe_recipedb.dart';

class FullRecipeResponse {
    final List<FullRecipeDb> meals;

    FullRecipeResponse({
        required this.meals,
    });

    factory FullRecipeResponse.fromJson(Map<String, dynamic> json) => FullRecipeResponse(        
      meals: List<FullRecipeDb>.from(json["meals"].map((x)=>FullRecipeDb.fromJson(x)))
      //meals: List<Map<String, String?>>.from(json["meals"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
      "meals": List<dynamic>.from(meals.map( (x) => x.toJson()))  
      //"meals": List<dynamic>.from(meals.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
