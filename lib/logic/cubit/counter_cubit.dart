import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    addError(Exception("Couldn't write to storage!"), StackTrace.current);
    return state.toMap();
  }
}
