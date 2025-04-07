import 'dart:convert';

import 'package:meal_recipes_app/infraestructure/models/category_db.dart';

CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) => json.encode(data.toJson());

class CategoryResponse {
    final List<CategoryDb> categories;

    CategoryResponse({
        required this.categories,
    });

    factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
        categories: List<CategoryDb>.from(json["categories"].map((x) => CategoryDb.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}
