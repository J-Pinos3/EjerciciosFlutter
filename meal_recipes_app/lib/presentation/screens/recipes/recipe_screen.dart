

import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key, required this.recipeId});
  
  final String recipeId;
  static const name = "recipe-screen";


  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Text("Recipe Information"),
    );
  }
}