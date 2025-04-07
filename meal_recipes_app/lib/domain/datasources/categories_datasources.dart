import '../entities/entities.dart';

abstract class CategoriesDataSource{

  Future<List<Category>> getAllCategories();
}