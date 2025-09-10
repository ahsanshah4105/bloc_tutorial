import 'package:bloc_tutorial/bloc/to_do/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  var item = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do Screen')),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return Text('Todo List is empty');
          } else {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                        context.read<ToDoBloc>().add(RemoveToDoEvent(removeItem: state.todoList[index]));
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          item+1;
            context.read<ToDoBloc>().add(AddToDoEvent(addItem: 'Task ${item++}'));

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
