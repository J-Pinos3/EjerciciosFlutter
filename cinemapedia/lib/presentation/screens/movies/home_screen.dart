import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.childView});

  final StatefulNavigationShell childView;
  static const name = "home-screen";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: childView,
      bottomNavigationBar:CustomBottomNavigationBar(navigationShellStateful: childView),
    );
  }
}

