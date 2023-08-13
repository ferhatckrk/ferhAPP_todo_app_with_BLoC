// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/todos/bloc/todos_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/todos/widget/task_tile.dart';
import 'package:my_todo_app_with_bloc/product/enum/enum.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_scnackbar.dart';

class TodosView extends StatelessWidget {
  static const String routename = "/todosview";
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        return BlocListener<TodosBloc, TodosState>(
          listener: (context, state) {
            if (state is TodosDoneTodoState) {
              showSnackBar(
                  context: context,
                  message: "Tamamlandı",
                  type: EnumSnackBarType.success);
            } else if (state is TodosNotDoneTodoState) {
              showSnackBar(
                  context: context,
                  message: "Geri Alındı",
                  type: EnumSnackBarType.message);
            }
          },
          child: Scaffold(
            body: ListView.builder(
              itemCount: context.read<TodosBloc>().todoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  todo: context.read<TodosBloc>().todoList[index],
                  onTap: () {
                    final bloc = context.read<TodosBloc>();
                    if (bloc.todoList[index].isDone) {
                      bloc.add(TodosNotDoneTodoEvent(bloc.todoList[index]));
                    } else {
                      bloc.add(TodosDoneTodoEvent(bloc.todoList[index]));
                    }
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
