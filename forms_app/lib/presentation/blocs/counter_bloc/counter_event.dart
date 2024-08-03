part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent{
  final int valueToIncrease;

  const CounterIncreased(this.valueToIncrease);
  
}

class CounterReset extends CounterEvent{
  const CounterReset();
}

class CounterMultiplied extends CounterEvent{
  final int valueToMultiply;
  const CounterMultiplied(this.valueToMultiply);
}
