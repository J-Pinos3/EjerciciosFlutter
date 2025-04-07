

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes_app/domain/entities/entities.dart';
import 'package:meal_recipes_app/presentation/providers/fullrecipe/fullrecipes_repository_provider.dart';


final searchQueryProvider = StateProvider<String>((ref) => '');


final searchMealsProvider = StateNotifierProvider<SearchedMealsNotifier, List<FullRecipe>>((ref) {
  
  final searchMeals = ref.read( recipesRepositoryProvicer ).searchMeals;

  return SearchedMealsNotifier(
    searchMeals: searchMeals,
    ref: ref
    );

});


typedef SearchMealsCallback  = Future<List<FullRecipe>> Function(String query);


class SearchedMealsNotifier extends StateNotifier<List<FullRecipe>>{

  SearchMealsCallback searchMeals;
  final Ref ref;


  SearchedMealsNotifier({
    required this.searchMeals,
    required this.ref
  }): super([]);


  Future<List<FullRecipe>> searchMealsByQuery(String query) async{
    final List<FullRecipe> recipes = await searchMeals(query); 
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = recipes;
    return recipes;
  }
}