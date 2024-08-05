import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

//*Toda esta vista ↓ tiene acceso al Counter Cubit
class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  //otra forma de incrementar los valores con read
  void IncreaseCounterBy(BuildContext ctx, [int value = 1]){
    ctx.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {

    //en lugar de poner el builder en el widget
    //*forma 2 ahora escuchamos los cambios del state
    //* al ser '' global '' cuando cambia el state, todo se redibuja
    final counterState = context.watch<CounterCubit>().state;
    
    /* *
     * USEFUL DOCS
     * https://medium.com/@soojlee0701/how-to-use-provider-context-read-watch-and-select-1e41938fdf62
     * 
    */
    //*con read no redibujamos, es ideal para métodos
    //* mi forma (/A) ↓
    //*final counterCubit = context.read<CounterCubit>();

    return Scaffold(
        appBar: AppBar(
          title: Text("Cubit counter: ${counterState.transactionCount}"),
          actions: [
            IconButton(
                onPressed: () => {
                  //en forma corta
                  context.read<CounterCubit>().reset()
                  //* ↓ con la variable que yo declaré en (/A) 
                  //*counterCubit.reset()

                },
                icon: const Icon(Icons.refresh_rounded)
            )
          ],
        ),
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            //*forma 1buildWhen: (previous, current) => current.counter != previous.counter ,
            builder: (context, state) {
              print("counter cambió");
              return Text("counter value: ${state.counter}");
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              child: const Text("+3"),
              onPressed: () => {
                IncreaseCounterBy(context, 3)
                //* ↓ con la variable que yo declaré en (/A) 
                //counterCubit.increaseBy(3)
              },
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '2',
              child: const Text("+2"),
              onPressed: () => {
                IncreaseCounterBy(context, 2)
                //* ↓ con la variable que yo declaré en (/A) 
                //counterCubit.increaseBy(2)
              },
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '3',
              child: const Text("+1"),
              onPressed: () => {
                IncreaseCounterBy(context, 1)
                //counterCubit.increaseBy(1)
              },
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
