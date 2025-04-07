
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/full_recipe.dart';
import '../../../domain/repositories/local_storage_depository.dart';
import '../../../presentation/providers/providers.dart';


final favoritesRecipesProviders = StateNotifierProvider<StorageRecipesNotifier, Map<String, FullRecipe>>((ref){
  final loadNextPage = ref.watch(localStorageProvider);
  return StorageRecipesNotifier(localStorageRepo: loadNextPage);
});


class StorageRecipesNotifier extends StateNotifier<Map<String, FullRecipe>>{

  int page = 0;
  final LocalStorageRepository localStorageRepo;

  StorageRecipesNotifier({
    required this.localStorageRepo
  }): super({});

  Future<List<FullRecipe>> loadNextPage() async{
    final recipes = await localStorageRepo.loadRecipes(offset: page*10, limit: 20);
    page++;
    
    final tempRecipesMap = <String, FullRecipe>{};

    for(final mealRecipe in recipes){
      tempRecipesMap[mealRecipe.idMeal] = mealRecipe;
    }

    state = {...state, ...tempRecipesMap};
    return recipes;
  }

  Future<void> toogleFavorite(FullRecipe fullRecipe) async{
    await localStorageRepo.toggleFavorite(fullRecipe);
    final bool isRecipeInFavorites= state[fullRecipe.idMeal] != null;

    if(isRecipeInFavorites){
      state.remove(fullRecipe.idMeal);
      state = {...state};
    }else{
      state = {...state, fullRecipe.idMeal: fullRecipe};
    }
  }

}