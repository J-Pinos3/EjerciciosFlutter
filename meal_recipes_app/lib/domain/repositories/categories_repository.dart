import '../entities/entities.dart';

abstract class CategoriesRepository{

  Future<List<Category>> getAllCategories();
}