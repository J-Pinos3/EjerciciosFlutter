
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';


class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });


  void increaseCounterByMethod(BuildContext ctx, [int valueToChange = 1]){
    //ctx.read<CounterBloc>().add(  CounterIncreased(valueToChange)  );
    //*disparando eventos dentro del bloc
    ctx.read<CounterBloc>().increaseBy(valueToChange);
  }

  void resetCounterMethod(BuildContext ctx){
    //ctx.read<CounterBloc>().add( const CounterReset()   );
    ctx.read<CounterBloc>().resetCounter();
  }

  @override
  Widget build(BuildContext context) {

    final blocCounterState = context.watch<CounterBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc counter: ${blocCounterState.transactionCount}"),
        actions: [
          IconButton(
            onPressed: () => { resetCounterMethod(context) },
            icon: const Icon(Icons.refresh_rounded)
          )
        ],
      ),
    
      body: Center(
        child: context.select(
          ( CounterBloc counterBloc) => Text("counter value: ${counterBloc.state.counter}")
        ), 
      ),
    
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: '4',
            child: const Text("x10"),
            onPressed: () => context.read<CounterBloc>().multiplyBy(10)  ,
          ),
          const SizedBox(height: 15,),
    
          FloatingActionButton(
            heroTag: '1',
            child: const Text("+3"),
            onPressed: () => {   increaseCounterByMethod(context, 3)   },
          ),
          const SizedBox(height: 15,),
    
          FloatingActionButton(
            heroTag: '2',
            child: const Text("+2"),
            onPressed: () => {   increaseCounterByMethod(context, 2)   },
          ),
          const SizedBox(height: 15,) ,
    
          FloatingActionButton(
            heroTag: '3',
            child: const Text("+1"),
            onPressed: () => {   increaseCounterByMethod(context, 1)   },
          ),
          const SizedBox(height: 15,),
    
        ],
      )
    );
  }
}

