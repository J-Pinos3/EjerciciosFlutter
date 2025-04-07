import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recipes_app/presentation/delegates/search_meal_delegate.dart';
import 'package:meal_recipes_app/presentation/providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.icecream_outlined, color: colors.primary,),
              const SizedBox(width: 5),

              Text("NATURA", style: TextStyle(
                color: Colors.green[900], fontSize: 20, fontWeight: FontWeight.w900)
              ),
              const Spacer(),

              IconButton(
                onPressed: () {
                  final searchedMeals = ref.read(searchMealsProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMealsDelegate(
                      initialRecipes: searchedMeals,
                      searchMeals: ref.read(searchMealsProvider.notifier).searchMealsByQuery
                    )
                  ).then((meals){
                      if(meals == null) return;
                      context.push("/recipe/${meals.idMeal}");
                  });
                },

                icon: const Icon(Icons.search),
              )
            ],
          ),
        ),
      )
    );
  }
}

