import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterState()) {
    /*
    on<CounterIncreased>(   (event, emit) {
      emit( state.copyWith( counter: state.counter + event.valueToIncrease,
          transactionCount: state.transactionCount + 1 ));
    });
    */
    //on<CounterIncreased>( (event, emit) => _onCounterIncrease(event, emit) );
    //se puede omitir el mismo número de parámetros
    //*las 3 expresiones son iguales
    on<CounterIncreased>( _onCounterIncrease );

    on<CounterReset>( _onResetCounter );

    on<CounterMultiplied> ( _onMultiplyCounter );
  }

  void _onCounterIncrease( CounterIncreased event, Emitter<CounterState> emit ){
      emit(
        state.copyWith(
          counter: state.counter + event.valueToIncrease,
          transactionCount: state.transactionCount + 1
      ));
  }

  void _onResetCounter(CounterReset event, Emitter<CounterState> emit){
    emit(
      state.copyWith( counter: 0  )
    );
  }

  void _onMultiplyCounter( CounterMultiplied event, Emitter<CounterState> emit ){
    emit(
      state.copyWith(
        counter: state.counter * event.valueToMultiply,
        transactionCount: state.transactionCount + 1
      ));
  }

  void multiplyBy([int value = 1]){
    add(CounterMultiplied(value) );
  }

  //eventos dentro del bloc
  void increaseBy([int value = 1]){
    add(CounterIncreased(value));
  }

  void resetCounter(){
    add( const CounterReset() );
  }
}
