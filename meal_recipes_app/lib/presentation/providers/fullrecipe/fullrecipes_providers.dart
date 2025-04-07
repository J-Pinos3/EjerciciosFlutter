import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/entities.dart';
import '../fullrecipe/fullrecipes_repository_provider.dart';


final popularRandomRecipes = StateNotifierProvider<RandomRecipesNotifier, List<FullRecipe>>((ref){
  final fetchRandomRecipes = ref.watch(recipesRepositoryProvicer).getRandomMeals;
  return RandomRecipesNotifier(
    fetchRandomRecipes: fetchRandomRecipes
  );
});


final newRandomRecipes = StateNotifierProvider<RandomRecipesNotifier, List<FullRecipe>>((ref){
  final fetchRandomRecipes = ref.watch(recipesRepositoryProvicer).getRandomMeals;
  return RandomRecipesNotifier(
    fetchRandomRecipes: fetchRandomRecipes
  );
});


final searchRecipeByID = StateNotifierProvider<RandomRecipesNotifier, List<FullRecipe>>((ref){
  final fetchRecipeById = ref.watch(recipesRepositoryProvicer).searchMealsById;
  return RandomRecipesNotifier(
    fetchRandomRecipes: fetchRecipeById
  ); 
});



//use case
typedef RandomRecipesCallback = Future<List<FullRecipe>> Function(String recipeName);

class RandomRecipesNotifier extends StateNotifier<List<FullRecipe>>{

  bool isLoading = false;
  RandomRecipesCallback fetchRandomRecipes;

  RandomRecipesNotifier({
    required this.fetchRandomRecipes
  }):super([]);

  Future<void> loadRandomRecipes(String recipeName) async{
    if(isLoading){
      return;
    }

    isLoading = true;
    final List<FullRecipe> fullRecipesList = await fetchRandomRecipes(recipeName);
    //print("Random Recipes List $fullRecipesList");
    state = [...state, ...fullRecipesList];
    await Future.delayed(const Duration(microseconds: 300));
    isLoading = false;
  }

}