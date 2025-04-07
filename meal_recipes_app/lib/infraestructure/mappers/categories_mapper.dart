import '../models/models.dart';
import '../../domain/entities/entities.dart';

class CategoriesMapper{

  static Category categoriesDBtoEntity(CategoryDb categoryDb) => Category(
    idCategory: categoryDb.idCategory,
    strCategory: categoryDb.strCategory,
    strCategoryDescription: categoryDb.strCategoryDescription, 
    strCategoryThumb: categoryDb.strCategoryThumb);


}