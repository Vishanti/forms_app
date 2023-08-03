part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;
  CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {}
