part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoadAllTodosEvent extends TodosEvent {}

class TodosDoneTodoEvent extends TodosEvent {
  final Todo todo;
  const TodosDoneTodoEvent(this.todo);
}

class TodosNotDoneTodoEvent extends TodosEvent {
  final Todo todo;
  const TodosNotDoneTodoEvent(this.todo);
}
