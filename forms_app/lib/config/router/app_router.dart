import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';


final appRouter = GoRouter(

  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),


    GoRoute(
      path: '/cubits',
      builder: (context, state) {
        return const CubitCounterScreen();
      },
    ),


    GoRoute(
      path: '/counter-bloc',
      builder: (context, state) {
        return const BlocCounterScreen();
      },
    ),

    GoRoute(
      path: '/new-user',
      builder: (context, state) {
        return const RegisterScreen();
      },
    ),
  ]

);