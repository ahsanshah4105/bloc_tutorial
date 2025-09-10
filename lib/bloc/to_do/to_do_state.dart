part of 'to_do_bloc.dart';

class ToDoState extends Equatable{
  final List<dynamic?> todoList;
  const ToDoState({this.todoList = const []});

  ToDoState copyWith({dynamic? todoItem}) {
    return ToDoState(todoList:  todoItem ?? this.todoList);
  }

  @override
  List<Object?> get props => [todoList];
}

