// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class TodosLoadingState extends TodosState {}

class TodosLoadedAllTodosState extends TodosState {
  const TodosLoadedAllTodosState();
}

class TodosDoneTodoState extends TodosState {}

class TodoErrorTodoState extends TodosState {
  final String error;

  const TodoErrorTodoState(this.error);
}

class TodosNotDoneTodoState extends TodosState {}
