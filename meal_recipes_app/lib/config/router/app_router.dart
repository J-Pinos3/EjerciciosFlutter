

import 'package:go_router/go_router.dart';
import 'package:meal_recipes_app/presentation/screens/recipes/home_screen.dart';
import 'package:meal_recipes_app/presentation/screens/recipes/recipe_screen.dart';
import 'package:meal_recipes_app/presentation/views/home_views/favorites_view.dart';
import 'package:meal_recipes_app/presentation/views/home_views/home_view.dart';
import 'package:meal_recipes_app/presentation/views/home_views/search_view.dart';

final appRouter = GoRouter(

  initialLocation: "/",
  routes: [

    StatefulShellRoute.indexedStack(
      builder: (context, state, children) {
        return HomeScreen(childView: children);
      },
      branches: <StatefulShellBranch>[

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/",
              builder: (context, state) =>  HomeView(),
              routes: [
                GoRoute(
                  path: "recipe/:id",
                  name: RecipeScreen.name,
                  builder: (context, state) {
                    final recipeId = state.pathParameters["id"] ?? "no-id";
                    return RecipeScreen(recipeId: recipeId);
                  },
                )
              ]
            )
          ]
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/search",
              builder: (context, state) => const SearchView(),
            )
          ]
        ),


        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/favorites",
              builder: (context, state) => const FavoritesView(),
            )
          ]
        )


      ]
      
    ),

  ]


);