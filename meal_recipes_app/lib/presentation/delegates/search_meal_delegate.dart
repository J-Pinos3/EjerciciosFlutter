

import 'dart:async';


import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:meal_recipes_app/domain/entities/entities.dart';

typedef SearchMealsCallback = Future<List<FullRecipe>>Function(String query);

class SearchMealsDelegate extends SearchDelegate<FullRecipe?>{

  List<FullRecipe> initialRecipes;
  final SearchMealsCallback searchMeals;

  StreamController<List<FullRecipe>> debouncedRecipes = StreamController.broadcast();

  StreamController<bool> isLoadingStream = StreamController.broadcast();

  Timer? _debounceTimer;

  SearchMealsDelegate({
    required this.searchMeals,
    required this.initialRecipes
  });

  void clearStreams(){
    debouncedRecipes.close();
    isLoadingStream.close();
  }

  void _OnQueryChanged(String query){
    if(_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    isLoadingStream.add(true);
    _debounceTimer = Timer(const Duration(milliseconds: 500), ()async{
      isLoadingStream.add(false);
      final recipes = await searchMeals(query);
      debouncedRecipes.add(recipes);

      initialRecipes = recipes;
    });
  }

  Widget buildResultsAndSuggestions(){

    return StreamBuilder(

      initialData: initialRecipes,
      stream: debouncedRecipes.stream,
      builder: (context, snapshot) {
        final mealRecipes = snapshot.data ?? [];
        return ListView.builder(
          itemCount: mealRecipes.length,
          itemBuilder: (context, index) {
            return MealItem(
              mealRecipe: mealRecipes[index],
              onMealSelected: (context, mealRecipe){
                clearStreams();
                close(context, mealRecipe);
              }
            );
          },
        );
      },
    );
  }


  @override
  String get searchFieldLabel => "Buscar Receta";

  @override
  List<Widget>? buildActions(BuildContext context){
    return[

      StreamBuilder(
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          final bool isLoading = snapshot.data!;
          if(isLoading == true){
            return SpinPerfect(
              animate: query.isNotEmpty,
              infinite: true,
              spins: 5,
              duration: const Duration(seconds: 5),
              child: IconButton(
                onPressed: () => '',
                icon: const Icon(Icons.refresh_outlined),
              ),
            );
          }else{
            return FadeInRight(
              animate: query.isNotEmpty,
              duration: const Duration(milliseconds: 300),
              child: IconButton(
                onPressed:  ()=>query = '',
                icon: const Icon(Icons.clear)
              ),
            );
          }
        },
      )

    ];
  }


  @override
  Widget? buildLeading(BuildContext context){
    return IconButton(
      onPressed: () {
        clearStreams();
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }


  @override
  Widget buildResults(BuildContext context){
    return buildResultsAndSuggestions();
  }


  @override
  Widget buildSuggestions(BuildContext context){
    //this function might be invoked many times

    _OnQueryChanged(query);
    return buildResultsAndSuggestions();
  }

}

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealRecipe, required this.onMealSelected});

  final FullRecipe mealRecipe;
  final Function onMealSelected;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMealSelected(context, mealRecipe);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            // Imagen
            SizedBox(
              width: size.width * 0.20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  mealRecipe.strMealThumb,
                  loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Información
            Expanded( // Cambiado de SizedBox a Expanded para evitar desbordamientos
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mealRecipe.strMeal, style: textStyle.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),

                  if (mealRecipe.strTags != null && mealRecipe.strTags.isNotEmpty)
                    Text(
                      mealRecipe.strTags.length > 30
                          ? '${mealRecipe.strTags.substring(0, 30)}...' // Evitar errores de rango
                          : mealRecipe.strTags,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  else
                    const Text("no tags"),

                  Row(
                    children: [
                      const Icon(Icons.dining_outlined, size: 16),
                      const SizedBox(width: 5),
                      Text(mealRecipe.strCategory, maxLines: 1, overflow: TextOverflow.ellipsis),

                      const SizedBox(width: 15),
                      const Icon(Icons.location_on_outlined, size: 16),
                      const SizedBox(width: 5),
                      Text(mealRecipe.strArea, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
