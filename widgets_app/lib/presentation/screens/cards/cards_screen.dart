import 'package:flutter/material.dart';

class CardsScreens extends StatelessWidget {
  const CardsScreens({super.key});

  static const String name = "cards_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards screen"),
      ),
      body: const Placeholder(),
    );
  }
}