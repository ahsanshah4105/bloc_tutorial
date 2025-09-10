import 'package:bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:bloc_tutorial/bloc/counter/counter_event.dart';
import 'package:bloc_tutorial/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print('Widget build');
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc with Counter"),
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state){
            print("build");
            return Center(child: Text(state.counter.toString(), style:  TextStyle(fontSize: 50),));
          }),
          SizedBox(height: 100,),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(onPressed: (() => context.read<CounterBloc>().add(IncrementCounter())), child: Text('Increment') ),
                ),
              ),
              SizedBox(width: 30,),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(onPressed: (() => context.read<CounterBloc>().add(DecrementCounter())), child: Text('Decrement')),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}
