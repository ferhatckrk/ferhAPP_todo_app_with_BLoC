import 'package:my_todo_app_with_bloc/features/todo/model/todo_model.dart';
import 'package:my_todo_app_with_bloc/product/database/database.dart';

class TodoDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Todo records
  Future<int> createTodo(Todo todo) async {
    final db = await dbProvider.database;
    var result = db.insert(todoTABLE, todo.toJson());
    return result;
  }

  //Get All Todo items
  //Searches if query string was passed
  Future<List<Todo>> getTodos(
      {List<String>? columns = const [], required String? query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>>? result;
    if (query != null) {
      if (query.isNotEmpty) {
        result = await db.query(todoTABLE,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
      }
    } else {
      result = await db.query(todoTABLE, columns: columns);
    }

    List<Todo> todos = result!.isNotEmpty
        ? result.map((item) => Todo.fromJson(item)).toList()
        : [];
    return todos;
  }

  //Update Todo record
  Future<int> updateTodo(Todo todo) async {
    final db = await dbProvider.database;

    var result = await db.update(todoTABLE, todo.toJson(),
        where: "id = ?", whereArgs: [todo.id]);

    return result;
  }

  //Delete Todo records
  Future<int> deleteTodo(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(todoTABLE, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllTodos() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      todoTABLE,
    );

    return result;
  }
}
