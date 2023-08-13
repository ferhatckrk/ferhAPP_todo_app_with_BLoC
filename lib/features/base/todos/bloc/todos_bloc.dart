import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_app_with_bloc/features/todo/model/todo_model.dart';
import 'package:my_todo_app_with_bloc/product/repository/todo_repository.dart';
part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoRepository todoRepository;
  List<Todo> todoList = [];

  TodosBloc({required this.todoRepository}) : super(TodosInitial()) {
    on<TodosLoadAllTodosEvent>(_todosLoadAllTodosEvent);
    on<TodosDoneTodoEvent>(_todosDoneTodoEvent);
    on<TodosNotDoneTodoEvent>(_todosNotDoneEvent);
  }

  Future<FutureOr<void>> _todosDoneTodoEvent(
      TodosDoneTodoEvent event, emit) async {
    final result = await _updateTodo(event.todo.copyWith(isDone: true));
    if (result == 1) {
      await _todosLoadAllTodosEvent(event, emit);
      emit(TodosDoneTodoState());
    } else {
      emit(const TodoErrorTodoState("Unexpected Error"));
    }
  }

  FutureOr<void> _todosLoadAllTodosEvent(event, emit) async {
    emit(TodosLoadingState());
    todoList = await _getAllTodos();
    emit(const TodosLoadedAllTodosState());
  }

  FutureOr<dynamic> _getAllTodos() async {
    return await todoRepository.getAllTodos();
  }

  dynamic _updateTodo(Todo todo) async {
    final result = await todoRepository.updateTodo(todo);
    return result;
  }

  Future<FutureOr<void>> _todosNotDoneEvent(
      TodosNotDoneTodoEvent event, Emitter<TodosState> emit) async {
    final result = await _updateTodo(event.todo.copyWith(isDone: false));
    if (result == 1) {
      await _todosLoadAllTodosEvent(event, emit);
      emit(TodosNotDoneTodoState());
    } else {
      emit(const TodoErrorTodoState("Unexpected Error"));
    }
  }
}
