import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/_base/bloc/base_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/_base/view/base_view.dart';
import 'package:my_todo_app_with_bloc/features/base/add_todo/bloc/add_todo_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/home/bloc/home_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/todos/bloc/todos_bloc.dart';
 import 'package:my_todo_app_with_bloc/product/repository/todo_repository.dart';
import 'package:my_todo_app_with_bloc/product/router/router.dart';
import 'package:my_todo_app_with_bloc/product/theme/theme.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => TodoRepository(),
    child: MultiBlocProvider(
      providers: [
     
        BlocProvider(
            create: (context) =>
                AddTodoBloc(todoRepository: context.read<TodoRepository>())),
        BlocProvider(
            create: (context) =>
                TodosBloc(todoRepository: context.read<TodoRepository>())
                  ..add(TodosLoadAllTodosEvent())),
        BlocProvider(create: (context) => BaseBloc()),
        BlocProvider(
          create: (context) =>
              HomeBloc(todoRepository: context.read<TodoRepository>())
                ..add(HomeLoadAllTodosEvent()),
        )
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ProjectTheme.lightTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      home: BaseView(),
    );
  }
}
