import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  void counterReset(BuildContext context) {
    context.read<CounterBloc>().add(CounterReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc bloc) =>
            Text('Bloc Counter: ${bloc.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () => counterReset(context),
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) =>
            Text('Counter value: ${counterBloc.state.counter}')),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: 1,
          child: const Text('+3'),
          onPressed: () => increaseCounterBy(context, 3),
        ),
        const SizedBox(height: 15),
        FloatingActionButton(
          heroTag: 2,
          child: const Text('+2'),
          onPressed: () => increaseCounterBy(context, 2),
        ),
        const SizedBox(height: 15),
        FloatingActionButton(
          heroTag: 3,
          child: const Text('+1'),
          onPressed: () => increaseCounterBy(context),
        )
      ]),
    );
  }
}
