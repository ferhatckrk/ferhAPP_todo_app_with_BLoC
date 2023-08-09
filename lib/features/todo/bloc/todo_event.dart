// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Immutable {}

class TodoAddEvent extends TodoEvent {
  final Todo todo;
  TodoAddEvent({
    required this.todo,
  });
}
