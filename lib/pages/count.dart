import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit,int >(
      listener: (context, state) {
        if(state == 10 || state == -10){
          SnackBar snackBar =SnackBar(content:Text( 'Counter equal to $state '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Text(
          'Counter: $state',
          style: TextStyle(fontSize: 24),
        );
      },
    );;
  }
}
