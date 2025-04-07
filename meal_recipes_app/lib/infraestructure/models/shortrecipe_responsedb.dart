class ShortRecipeDB{

  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  ShortRecipeDB({
    required this.idMeal, required this.strMeal,
    required this.strMealThumb
  });

  factory ShortRecipeDB.fromJson(Map<String, dynamic> json) => ShortRecipeDB(
    idMeal: json["idMeal"],
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"]
  );

  Map<String, dynamic> toJson() =>{
    "idMeal": idMeal,
    "strMeal": strMeal,
    "strMealThumb" : strMealThumb
  };
}