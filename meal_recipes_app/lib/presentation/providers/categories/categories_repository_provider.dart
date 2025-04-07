

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes_app/infraestructure/datasources/categorycat_datasource.dart';
import 'package:meal_recipes_app/infraestructure/repositories/categories_repository_impl.dart';

final categoriesRepositoryProvider = Provider((ref){
  return CategoriesRepositoryImpl( CategoryCatDatasource() );
});