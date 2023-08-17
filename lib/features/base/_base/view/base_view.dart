// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/_base/bloc/base_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/add_todo/view/add_todo_view.dart';
import 'package:my_todo_app_with_bloc/features/base/home/view/home_view.dart';
import 'package:my_todo_app_with_bloc/features/base/todos/view/todos_view.dart';
import 'package:my_todo_app_with_bloc/product/widgets/appbar/project_app_bar.dart';
import 'package:my_todo_app_with_bloc/product/widgets/project_bottom_nav_bar.dart';

class BaseView extends StatefulWidget {
  static const String routeName = "/base-view";
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, BaseState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            appBar: ProjectAppBar(context: context),
            body: IndexedStack(
              index: state.pageIndex,
              children: [HomeView(), const TodosView(), AddTodoView()],
            ),
            bottomNavigationBar: ProjectBottomNavBar());
      },
    );
  }
}
