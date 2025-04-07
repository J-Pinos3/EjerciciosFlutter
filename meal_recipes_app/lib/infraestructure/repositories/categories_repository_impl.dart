

import '../../domain/entities/entities.dart';
import '../../domain/datasources/categories_datasources.dart';
import '../../domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository{
  final CategoriesDataSource dataSource;

  CategoriesRepositoryImpl(this.dataSource);

  @override
  Future<List<Category>> getAllCategories(){
    return dataSource.getAllCategories();
  }
}