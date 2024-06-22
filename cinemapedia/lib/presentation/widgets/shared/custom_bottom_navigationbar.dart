import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.navigationShellStateful});

  final StatefulNavigationShell navigationShellStateful;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        navigationShellStateful.goBranch(value);
      },
      currentIndex: navigationShellStateful.currentIndex,
      elevation: 1,
      items: const [//there must be more than 1 item
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: "Home" 
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: "Categories" 
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: "Favorites" 
        ),        
      ]
    );
  }
}