import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_todo_app_with_bloc/features/todo/model/todo_model.dart';
import 'package:my_todo_app_with_bloc/product/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;
  final _todoController = StreamController<List<Todo>>.broadcast();

  get todos => _todoController.stream;

  TodoBloc({required this.todoRepository}) : super(TodoInitial()) {
    getTodos();
    on<TodoAddEvent>(
      _addTodoEvent,
    );
  }

  FutureOr<void> _addTodoEvent(TodoAddEvent event, emit) async {
    await addTodo(event.todo);
    emit(TodoAddedState());
  }

  getTodos({String? query}) async {
    _todoController.sink.add(await todoRepository.getAllTodos(query: query));
    print(await todoRepository.getAllTodos(query: query));
  }

  addTodo(Todo todo) async {
    await todoRepository.insertTodo(todo);
    getTodos();
  }

  updateTodo(Todo todo) async {
    await todoRepository.updateTodo(todo);
    getTodos();
  }

  deleteTodoById(int id) async {
    todoRepository.deleteTodoById(id);
    getTodos();
  }

  dispose() {
    _todoController.close();
  }
}
