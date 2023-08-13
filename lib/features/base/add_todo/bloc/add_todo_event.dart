// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_todo_bloc.dart';

abstract class AddTodoEvent extends Equatable {
  const AddTodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodoTitleChangedEvent extends AddTodoEvent {
  final String title;
  const AddTodoTitleChangedEvent(this.title);
}

class AddTodoDescriptionChangedEvent extends AddTodoEvent {
  final String description;
  const AddTodoDescriptionChangedEvent(
    this.description,
  );
}

class AddTodoShowTimePickerEvent extends AddTodoEvent {
  const AddTodoShowTimePickerEvent();
}

class AddTodoShowDatePickerEvent extends AddTodoEvent {
  const AddTodoShowDatePickerEvent();
}

class AddTodoPickedTimeEvent extends AddTodoEvent {
  final String timeOfDay;
  const AddTodoPickedTimeEvent({required this.timeOfDay});
}

class AddTodoPickedDateEvent extends AddTodoEvent {
  final String date;
  const AddTodoPickedDateEvent({required this.date});
}

class AddTodoSaveTodoEvet extends AddTodoEvent {}
