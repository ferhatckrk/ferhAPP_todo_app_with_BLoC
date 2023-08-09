import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/_base/bloc/base_bloc.dart';
import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';

class ProjectBottomNavBar extends StatelessWidget {
  ProjectBottomNavBar({super.key});

  final List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: "Task"),
    BottomNavigationBarItem(
        icon: Image.asset(ProjectIconPaths.createTask.path, height: 40),
        label: ""),
    const BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month), label: "Calendar"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, BaseState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.pageIndex,
          items: bottomNavItems,
          onTap: (value) {
            context
                .read<BaseBloc>()
                .add(BasePageIndexChangedEvent(pageIndex: value));
          },
        );
      },
    );
  }
}
