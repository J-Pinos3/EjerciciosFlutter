import "package:go_router/go_router.dart";
import "package:widgets_app/presentation/screens/screens.dart";



final appRouter = GoRouter(
  initialLocation: "/",
  routes: [

    GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: "/buttons",
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),

    GoRoute(
      path: "/cards",
      name: CardsScreens.name,
      builder: (context, state) => const CardsScreens(),
    ),

    GoRoute(
      path: "/progress",
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),

    GoRoute(
      path: "/food",
      name: FoodScreen.name,
      builder: (context, state) => const FoodScreen(),
    ),
  ]
);