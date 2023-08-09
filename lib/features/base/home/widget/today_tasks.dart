import 'package:flutter/material.dart';
import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';
import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';

class TodayTasks extends StatelessWidget {
  const TodayTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      color: const Color.fromARGB(255, 242, 240, 240),
      child: Column(children: [
        addSpaceVertical(10),
        Text(
          "Todays Task",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        addSpaceVertical(5),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return _taskItem(context);
            },
          ),
        ),
        addSpaceVertical(10)
      ]),
    );
  }

  Container _taskItem(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 100,
      width: 180,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: ProjectColors.purple,
            spreadRadius: 0.1,
            blurRadius: 1,
            blurStyle: BlurStyle.solid,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        addSpaceVertical(10),
        Text(
          "Dentist",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        addSpaceVertical(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ProjectIconPaths.time.path, height: 15),
            addSpaceHorizontal(5),
            Text(
              "11:15 - 12:00",
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        )
      ]),
    );
  }
}
