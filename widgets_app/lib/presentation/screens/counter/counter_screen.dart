import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  static const String name = "counter_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounterFromProvider = ref.watch( counterProvider );
    final bool setLightDarkMode = ref.watch( themeNotifierProvider ).isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          IconButton(
            icon: setLightDarkMode ? const Icon(Icons.dark_mode_outlined) : const Icon(Icons.light_mode_outlined),
            onPressed: (){
              //ref.read( isDarkModeProvider.notifier ).state = !ref.read( isDarkModeProvider.notifier ).state;
              ref.read( themeNotifierProvider.notifier ).toggleDarkMode();
            },
          )
        ],
      ),
      body: Center(
        child: Text("Valor: $clickCounterFromProvider",
        style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read( counterProvider.notifier ).state++;
          //ref.read(counterProvider.notifier).update((state) => state+1);
        },
      ),
    );
  }
}