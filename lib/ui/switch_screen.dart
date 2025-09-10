import 'package:bloc_tutorial/bloc/switch/switch_bloc.dart';
import 'package:bloc_tutorial/bloc/switch/switch_event.dart';
import 'package:bloc_tutorial/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    print('widget build');
    return Scaffold(
      appBar: AppBar(title: Text('Switch Screen')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.value != current.value,
                  builder: (context, state) {
                    print('notifications');
                    return Switch(
                      value: state.value,
                      onChanged: (newValue) {
                        context.read<SwitchBloc>().add(
                          EnableOrDisableNotification(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.opacity != current.opacity,
              builder: (context, state) {
                print("Opacity");
                return Container(
                  height: 200,
                  color: Colors.blue.withOpacity(state.opacity.toDouble()),
                );
              },
            ),

            SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.opacity != current.opacity,
              builder: (context, state) {
                print('slider');
                return Slider(
                  value: state.opacity,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(
                      ChangeOpacity(opacity: value),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
