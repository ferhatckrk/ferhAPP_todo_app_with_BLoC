import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_app_with_bloc/features/todo/model/todo_model.dart';
import 'package:my_todo_app_with_bloc/product/repository/todo_repository.dart';

part 'add_todo_event.dart';
part 'add_todo_state.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  Todo _todo =
      Todo(title: "", decription: "", isDone: false, date: "", time: "");
  final TodoRepository todoRepository;

  Todo get todo => _todo;

  AddTodoBloc({required this.todoRepository}) : super(const AddTodoInitial()) {
    on<AddTodoTitleChangedEvent>(_addTodoTitleChangedEvent);
    on<AddTodoDescriptionChangedEvent>(_addTodoDescriptionChangedEvent);
    on<AddTodoShowTimePickerEvent>(_addTodoShowTimePickerEvent);
    on<AddTodoShowDatePickerEvent>(_addTodoShowDatePickerEvent);
    on<AddTodoPickedTimeEvent>(_addTodoPickedTimePickerEvent);
    on<AddTodoPickedDateEvent>(_addTodoPickedDateEvent);
    on<AddTodoSaveTodoEvet>(_addTodoSaveTodoEvet);
  }

  FutureOr<void> _addTodoTitleChangedEvent(
      AddTodoTitleChangedEvent event, emit) {
    _todo = _todo.copyWith(title: event.title);
  }

  FutureOr<void> _addTodoDescriptionChangedEvent(
      AddTodoDescriptionChangedEvent event, Emitter<AddTodoState> emit) {
    _todo = _todo.copyWith(decription: event.description);
  }

  FutureOr<void> _addTodoShowTimePickerEvent(
      AddTodoShowTimePickerEvent event, Emitter<AddTodoState> emit) {
    emit(AddTodoShowTimePickerState());
  }

  FutureOr<void> _addTodoShowDatePickerEvent(
      AddTodoShowDatePickerEvent event, Emitter<AddTodoState> emit) {
    emit(AddTodoShowDatePickerState());
  }

  FutureOr<void> _addTodoPickedTimePickerEvent(
      AddTodoPickedTimeEvent event, Emitter<AddTodoState> emit) {
    _todo = _todo.copyWith(time: event.timeOfDay.toString());
    emit(AddTodoPickedTimeState());
  }

  FutureOr<void> _addTodoSaveTodoEvet(
      AddTodoSaveTodoEvet event, Emitter<AddTodoState> emit) {
    if (_todo.title.isEmpty) {
      emit(const AddTodoErrorState(titleTextError: "Title Boş bırakılamaz!"));
    } else {
      todoRepository.insertTodo(_todo);
      emit(AddTodoSavedTodoState(todo: _todo));
    }
  }

  FutureOr<void> _addTodoPickedDateEvent(
      AddTodoPickedDateEvent event, Emitter<AddTodoState> emit) {
    _todo = _todo.copyWith(date: event.date);
    emit(AddTodoPickedDateState());
  }
}
