part of 'counter_cubit.dart';


class CounterState extends Equatable{

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0,
    this.transactionCount = 0
  });

  
  //*un nuevo estado es una nueva instancia de este estado
  //*copia del estado actual ↓

  copyWith({
    int? counter,
    int? transactionCount
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount
  );
  
  @override
  List<Object> get props => [ counter, transactionCount ];
  //* ↑ son los campos que equatable usará para determinar la igualdad de un objeto-estado 


}