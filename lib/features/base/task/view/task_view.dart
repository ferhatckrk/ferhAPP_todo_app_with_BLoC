// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_todo_app_with_bloc/features/base/task/widget/task_tile.dart';

class TasksView extends StatelessWidget {
  static const String routename = "/taskview";
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const TaskTile();
        },
      ),
    );
  }
}
