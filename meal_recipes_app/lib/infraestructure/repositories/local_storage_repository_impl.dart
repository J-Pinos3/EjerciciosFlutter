import '../../domain/datasources/local_storage_datasource.dart';
import '../../domain/entities/full_recipe.dart';
import '../../domain/repositories/local_storage_depository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository{

final LocalStorageDatasource datasource;
LocalStorageRepositoryImpl({required this.datasource});

  @override
  Future<bool> isRecipeFavorite(String idMeal) {
    return datasource.isRecipeFavorite(idMeal);
  }

  @override
  Future<List<FullRecipe>> loadRecipes({int limit = 10, int offset = 0}) {
    return datasource.loadRecipes(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(FullRecipe fullRecipe) {
    return datasource.toggleFavorite(fullRecipe);
  }


}