import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recipes_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.childView});

  final StatefulNavigationShell childView;
  static const name = "home-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: CustomBottomNavigationBar(navigationShellStateful: childView),
    );
  }
}