import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(countValue: 0)) {
    on<IncrementCounter>((event, emit) {
      emit(CounterState(countValue: state.countValue + 1));
    });

    on<DecrementCounter>((event, emit) {
      emit(CounterState(countValue: state.countValue - 1));
    });
  }
}
