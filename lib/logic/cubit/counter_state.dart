import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  int counterValue;
  bool? wasIncremented;

  CounterState({required this.counterValue, this.wasIncremented});

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, wasIncremented];
}
