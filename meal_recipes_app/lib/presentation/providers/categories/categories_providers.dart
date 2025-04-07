

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes_app/domain/entities/categories.dart';
import 'package:meal_recipes_app/presentation/providers/categories/categories_repository_provider.dart';

final allCategories = StateNotifierProvider<CategoriesNotifier, List<Category>>((ref){
  final fetchAllCategories = ref.watch(categoriesRepositoryProvider).getAllCategories;

  return CategoriesNotifier(
    categoriesCallback: fetchAllCategories
  );
});


typedef CategoriesCallback = Future<List<Category>> Function();

class CategoriesNotifier extends StateNotifier<List<Category>>{

  bool isLoading = false;
  CategoriesCallback categoriesCallback;

  CategoriesNotifier({
    required this.categoriesCallback
  }):super([]);

  Future<void> loadMealCategories() async{
    if(isLoading){
        return ;
    }

    isLoading = true;
    final List<Category> categoriesList = await categoriesCallback();
    state = [ ...state, ...categoriesList ];

    await Future.delayed(const Duration(microseconds: 350));
    isLoading = false;
  }


}