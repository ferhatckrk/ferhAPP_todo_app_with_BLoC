import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/home/widget/project_calendar.dart';
import 'package:my_todo_app_with_bloc/features/base/home/widget/today_tasks.dart';
import 'package:my_todo_app_with_bloc/features/base/home/widget/welcome_input.dart';
import 'package:my_todo_app_with_bloc/features/todo/bloc/todo_bloc.dart';
import 'package:my_todo_app_with_bloc/product/repository/todo_repository.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/home-view";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = TodoBloc(todoRepository: context.read<TodoRepository>());
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  StreamBuilder<Object>(
                      stream: bloc.todos,
                      builder: (context, snapshot) {
                        return WelcomeInput(
                          controller: controller,
                          onChanged: (value) {
                            bloc.getTodos(query: value);
                          },
                        );
                      }),
                  const TodayTasks(),
                  addSpaceVertical(10),
                  const ProjectCalender()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
