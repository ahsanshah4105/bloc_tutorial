part of 'to_do_bloc.dart';

abstract class ToDoEvent extends Equatable{
  const ToDoEvent();
}

class AddToDoEvent extends ToDoEvent{
  final String addItem;

  const AddToDoEvent({required this.addItem});

  @override
  List<Object?> get props => [addItem];

}
class RemoveToDoEvent extends ToDoEvent{
  final Object removeItem;
  const RemoveToDoEvent({required this.removeItem});
  @override
  List<Object?> get props => [removeItem];
}