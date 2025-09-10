import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todoList =  [];
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDoEvent>(_addInTodoList);
    on<RemoveToDoEvent>(_removeFromTodoList);
  }

  void _addInTodoList(AddToDoEvent event, Emitter<ToDoState> emit) {
    todoList.add(event.addItem);
  emit(state.copyWith(todoItem: List.from(todoList)));
  }
  void _removeFromTodoList(RemoveToDoEvent event, Emitter<ToDoState> emit) {
    todoList.remove(event.removeItem);
    emit(state.copyWith(todoItem: List.from(todoList)));
  }
}
