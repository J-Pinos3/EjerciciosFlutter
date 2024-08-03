import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: [
          ListTile(

            title: const Text("Cubits"),
            subtitle: const Text("Gestor de estado simple con cubits"),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () =>  context.push('/cubits') ,
          ),

          ListTile(

            title: const Text("Counter Bloc"),
            subtitle: const Text("Gestor de estado con bloc"),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () =>  context.push('/counter-bloc') ,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),

          ListTile(

            title: const Text("Register Screen"),
            subtitle: const Text("Pantalla de Formularios"),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () =>  context.push('/new-user') ,
          ),
        ],
      ),
    );
  }
}