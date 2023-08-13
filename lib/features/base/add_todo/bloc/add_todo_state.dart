// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_todo_bloc.dart';

abstract class AddTodoState {
  const AddTodoState();
}

class AddTodoInitial extends AddTodoState {
  const AddTodoInitial() : super();
}

class AddTodoErrorState extends AddTodoState {
  final String? titleTextError;
  final String? descriptionError;
  final String? dateError;
  final String? timeError;
  const AddTodoErrorState({
    this.titleTextError,
    this.descriptionError,
    this.dateError,
    this.timeError,
  });
}

class AddTodoShowTimePickerState extends AddTodoState {}

class AddTodoShowDatePickerState extends AddTodoState {}

class AddTodoCloseTimePickerState extends AddTodoState {}

class AddTodoPickedTimeState extends AddTodoState {}

class AddTodoPickedDateState extends AddTodoState {}

class AddTodoSavedTodoState extends AddTodoState {
  final Todo todo;
  AddTodoSavedTodoState({
    required this.todo,
  });
}
