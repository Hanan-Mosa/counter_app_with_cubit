import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    final count = context.read<CounterCubit>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
          centerTitle: true,
        ),
        body: BlocListener<CounterCubit, int>(
          listener: (context, state) {
           if (state <0){
             dialog();
           }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterCubit, int>(
                  builder: (context, state) {
                    return Text(
                      'Counter: $state',
                      style: TextStyle(fontSize: 24),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                count.increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
              onPressed: () {
                count.decrement();
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        )

    );
  }

  dialog() {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Counter Error'),
            content: Text('Counter cannot be negative.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),

            ],
          ),
    );
  }
}

