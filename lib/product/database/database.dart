import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

const todoTABLE = 'Todo';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    print("CREATE DATABASE");
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, "ReactiveTodo.db");
    var database = await openDatabase(path,
        version: 1,
        onCreate: (db, version) => initDB(db, version),
        onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Todo(
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT, 
        isDone INTEGER,
        date TEXT
      )
    ''');
  }
}
