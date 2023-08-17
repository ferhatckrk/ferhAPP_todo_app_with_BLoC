import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/home/bloc/home_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/home/widget/project_calendar.dart';
import 'package:my_todo_app_with_bloc/features/base/home/widget/today_tasks.dart';
import 'package:my_todo_app_with_bloc/features/base/home/widget/welcome_input.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "/home-view";
  HomeView({super.key});

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height * 0.8,
                child: Column(
                  children: [
                    WelcomeInput(
                      controller: controller,
                      onChanged: (value) {
                        //   bloc.getTodos(query: value);
                        bloc.add(HomeSearchingEvent(value));
                      },
                    ),
                    if (state is! HomeSearchingState) ...{
                      TodayTasks(todoList: bloc.todoList),
                      addSpaceVertical(10),
                      const ProjectCalender()
                    } else ...{
                      SizedBox(
                        height: size.height * 0.7,
                        child: ListView.builder(
                          itemCount: state.todoList.length,
                          itemBuilder: (context, index) => SizedBox(
                            height: 100,
                            child: ListTile(
                              title: Text(state.todoList[index].title),
                            ),
                          ),
                        ),
                      )
                    }

                    /*   StreamBuilder<List<Todo>>(
                      stream: bloc.todosStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Column(
                            children: [
                              TodayTasks(todoList: bloc.todoList),
                              addSpaceVertical(10),
                              const ProjectCalender()
                            ],
                          );
                        } else {
                          return SizedBox(
                            height: 300,
                            child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) => SizedBox(
                                      height: 100,
                                      child: ListTile(
                                        title:
                                            Text(snapshot.data![index].title),
                                      ),
                                    )),
                          );
                        }
                      },
                    ) ,*/
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
