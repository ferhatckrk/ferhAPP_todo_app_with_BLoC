import 'package:flutter/material.dart';
import 'package:my_todo_app_with_bloc/features/auth/meeting/view/meeting_view.dart';
import 'package:my_todo_app_with_bloc/features/base/_base/view/base_view.dart';
import 'package:my_todo_app_with_bloc/features/base/add_task/view/add_task_view.dart';
import 'package:my_todo_app_with_bloc/features/base/home/view/home_view.dart';
import 'package:my_todo_app_with_bloc/features/base/task/view/task_view.dart';

class AppRouter {
  static dynamic generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MeetingView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MeetingView(),
        );
      case HomeView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeView(),
        );
      case BaseView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const BaseView(),
        );
      case AddTaskView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AddTaskView(),
        );
      case TasksView.routename:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => TasksView(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(
              body: Center(
                  child: Text(
            "Sorry, page not found! \n:(",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          ))),
        );
    }
  }
}
