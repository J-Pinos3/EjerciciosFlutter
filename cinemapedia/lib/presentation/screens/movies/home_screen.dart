import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.childView});

  static const name = "home-screen";

  final Widget childView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView, 
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

