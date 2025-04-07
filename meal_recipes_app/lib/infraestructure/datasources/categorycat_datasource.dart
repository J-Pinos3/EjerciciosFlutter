
import 'package:dio/dio.dart';

import '../models/models.dart';
import '../../domain/entities/entities.dart';
import '../mappers/mappers.dart';
import '../../domain/datasources/categories_datasources.dart';

class CategoryCatDatasource extends CategoriesDataSource{

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://www.themealdb.com/api/json/v1/1"
    )
  );

  List<Category> _jsonCategoryToCategory( Map<String, dynamic> json ){
    final categoryResponse = CategoryResponse.fromJson(json);

    final List<Category> categories = categoryResponse.categories
    .map((categoryDb) => CategoriesMapper.categoriesDBtoEntity(categoryDb)).toList();

    return categories;
  }


  @override
  Future<List<Category>> getAllCategories() async {

    final response = await dio.get('/categories.php');
    return _jsonCategoryToCategory(response.data);
  }

}