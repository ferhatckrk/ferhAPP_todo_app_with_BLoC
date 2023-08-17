import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_app_with_bloc/product/model/error.dart';
import 'package:my_todo_app_with_bloc/product/model/todo_model.dart';
import 'package:my_todo_app_with_bloc/product/repository/todo_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TodoRepository _todoRepository;
  final _todoController = StreamController<List<Todo>>.broadcast();

  List<Todo> _todoList = [];

  List<Todo> get todoList => _todoList;
  get todosStream => _todoController.stream;

  HomeBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(HomeInitial()) {
    on<HomeLoadAllTodosEvent>(_homeLoadAllTodosEvent);
    on<HomeSearchingEvent>(_homeSearchingEvent);
  }

  FutureOr<void> _homeLoadAllTodosEvent(
      HomeLoadAllTodosEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final result = await _fetchAllTodos();

    if (result is RepoError) {
      emit(HomeErrorState(errorText: result.errorMessage));
    } else {
      _todoList = result;
      emit(HomeLoadedState());
    }
  }

  Future<T> _fetchAllTodos<T>() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return await _todoRepository.getAllTodos() as T;
    } catch (e) {
      return RepoError(errorMessage: e.toString()) as T;
    }
  }

  getTodos({String? query}) async {
    //_todoController.sink.add(await _todoRepository.getAllTodos(query: query));
    return await _todoRepository.getAllTodos(query: query);
  }

  FutureOr<void> _homeSearchingEvent(
      HomeSearchingEvent event, Emitter<HomeState> emit) async {
    if (event.searchInputText.isNotEmpty) {
      var todoList = await getTodos(query: event.searchInputText);
      print("ARAMA SONUCU" + todoList.length.toString());
      emit(HomeSearchingState(todoList));
    } else {
      emit(HomeLoadedState());
    }
  }
}
