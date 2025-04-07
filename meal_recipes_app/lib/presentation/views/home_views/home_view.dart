import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes_app/presentation/widgets/categories/categories_listview.dart';
import 'package:meal_recipes_app/presentation/widgets/recipes/recipes_horizontal_listview.dart';
import '../../providers/providers.dart';

import '../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  HomeView({super.key});

  final preloadedRecipesList = <String>[
    "ec","pi","ha","as","to"
  ];

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();
    int rand1 = Random().nextInt( widget.preloadedRecipesList.length );
    int rand2 = Random().nextInt( widget.preloadedRecipesList.length );

    if(rand2 == rand1 && (rand1 >= 0 && rand1 < widget.preloadedRecipesList.length) ){
      rand2--;
    }

    String randomRecipeName1 = widget.preloadedRecipesList[  rand1   ];
    String randomRecipeName2 = widget.preloadedRecipesList[  rand2   ];

    print("Random Recipe Name  $randomRecipeName1");


    //ref.read(allCategories.notifier).loadMealCategories();
    ref.read(popularRandomRecipes.notifier).loadRandomRecipes(randomRecipeName1);
    ref.read(newRandomRecipes.notifier).loadRandomRecipes( randomRecipeName2 );
  }


  @override
  Widget build(BuildContext context) {
    
    final randomPopularRecipes = ref.watch(popularRandomRecipes);
    final newwRandomRecipes = ref.watch(newRandomRecipes);
    //final allMealCategories = ref.watch(allCategories);
    //print("Random Recipes List $randomRecipes");
    return CustomScrollView(

      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            title: CustomAppBar(),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //recipes categories slideshow
                    //CategoriesListView(categories: allMealCategories,),

                    //Recipes HorizontalListView
                    RecipesHorizontalListView(recipes: randomPopularRecipes, title: "Recetas Populares"),

                    //Recipes HorizontalListView
                    RecipesHorizontalListView(recipes: newwRandomRecipes, title: "Nuevas Recetas"),
                  ],
                );
              },
              childCount: 1
          ))
      ],

    );
  }
}