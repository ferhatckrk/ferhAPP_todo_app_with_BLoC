import 'package:my_todo_app_with_bloc/features/todo/model/todo_model.dart';
import 'package:my_todo_app_with_bloc/product/dao/todo_dao.dart';

class TodoRepository {
  final todoDao = TodoDao();

  Future getAllTodos({String? query}) => todoDao.getTodos(query: query);

  Future insertTodo(Todo todo) => todoDao.createTodo(todo);

  Future updateTodo(Todo todo) => todoDao.updateTodo(todo);

  Future deleteTodoById(int id) => todoDao.deleteTodo(id);

  Future deleteAllTodos() => todoDao.deleteAllTodos();
}
