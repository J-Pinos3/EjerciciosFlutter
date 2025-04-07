import 'package:isar/isar.dart';
import '../../domain/datasources/local_storage_datasource.dart';
import '../../domain/entities/full_recipe.dart';
import 'package:path_provider/path_provider.dart';


class IsarDatasource extends LocalStorageDatasource{

  late Future<Isar> db;
  IsarDatasource(){
    db = OpenDB();
  }

  Future<Isar>OpenDB() async{
    if(Isar.instanceNames.isEmpty){
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [FullRecipeSchema],
        inspector: true,
        directory:dir.path 
      );
    }

    return Future.value(Isar.getInstance());
  }
  

  @override
  Future<bool> isRecipeFavorite(String idMeal) async{
    final isar = await db;
    final FullRecipe? isRecipeFavorite = await isar.fullRecipes
      .filter()
      .idMealEqualTo(idMeal)
      .findFirst();

    return isRecipeFavorite != null;
  }


  @override
  Future<void> toggleFavorite(FullRecipe fullRecipe) async{
    final isar = await db;

    final favoriteRecipe = await isar.fullRecipes
      .filter()
      .idMealEqualTo(fullRecipe.idMeal)
      .findFirst();

      if(favoriteRecipe != null){
        isar.writeTxnSync(() => isar.fullRecipes.deleteSync(favoriteRecipe.isarId!));
        return;
      }

      isar.writeTxnSync(() => isar.fullRecipes.putSync(fullRecipe));
  }


  @override
  Future<List<FullRecipe>> loadRecipes({int limit = 10, int offset = 0}) async{
      final isar = await db;
      return isar.fullRecipes.where()
      .offset(offset)
      .limit(limit)
      .findAll();
  }
  

}

