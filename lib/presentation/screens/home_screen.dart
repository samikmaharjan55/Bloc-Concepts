import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/constants/enums.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_state.dart';
import 'package:flutter_bloc_concepts/logic/cubit/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Wifi) {
                return const Text('Wi-Fi');
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                return const Text('Mobile');
              } else if (state is InternetDisconnected) {
                return const Text('Disconnected');
              }
              return const CircularProgressIndicator();
            }),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    ' ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
            // const SizedBox(
            //   height: 25,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () {
            //         BlocProvider.of<CounterCubit>(context).decrement();
            //         //context.bloc<CounterCubit>().decrement();
            //       },
            //       tooltip: 'Decrement',
            //       child: const Icon(Icons.remove),
            //     ),
            //     FloatingActionButton(
            //       onPressed: () {
            //         BlocProvider.of<CounterCubit>(context).increment();
            //         //context.bloc<CounterCubit>().increment();
            //       },
            //       tooltip: 'Increment',
            //       child: const Icon(Icons.add),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text('Go to Second Screen'),
            ),
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text('Go to Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
