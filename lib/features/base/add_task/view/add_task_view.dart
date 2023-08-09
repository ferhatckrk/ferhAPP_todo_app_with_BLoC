// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app_with_bloc/features/todo/bloc/todo_bloc.dart';
import 'package:my_todo_app_with_bloc/features/todo/model/todo_model.dart';
import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';
import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';
import 'package:my_todo_app_with_bloc/product/widgets/button/project_button.dart';
import 'package:my_todo_app_with_bloc/product/widgets/checkbox/project_checkbox.dart';
import 'package:my_todo_app_with_bloc/product/widgets/text/project_label_text.dart';
import 'package:my_todo_app_with_bloc/product/widgets/textfield/project_textfield.dart';

class AddTaskView extends StatelessWidget {
  static const String routeName = '/addTaskView';
  AddTaskView({super.key});

  final double baseHeight = 10;

  bool checkValue = false;
  final titileController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => closeFocus(),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProjectTextFieldLabelText(
                  text: "Title",
                ),
                addSpaceVertical(baseHeight),
                ProjectTextField(
                  hintText: "Write title of your schdedule!",
                  controller: titileController,
                ),
                addSpaceVertical(baseHeight),
                const ProjectTextFieldLabelText(
                  text: "Description",
                ),
                addSpaceVertical(baseHeight),
                ProjectTextField(
                  hintText: "Detailed Information",
                  height: 200,
                  controller: descController,
                ),
                addSpaceVertical(baseHeight),
                const ProjectTextFieldLabelText(text: "Date & Time"),
                addSpaceVertical(baseHeight),
                Row(
                  children: [
                    _CustomCard(
                      imagePath: ProjectIconPaths.date.path,
                      title: 'Pick Date',
                      onTap: () => debugPrint("pick data"),
                    ),
                    addSpaceHorizontal(20),
                    _CustomCard(
                      imagePath: ProjectIconPaths.time.path,
                      title: 'Pick time',
                      onTap: () => debugPrint("pick time"),
                    ),
                  ],
                ),
                addSpaceVertical(20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ProjectCheckBox(
                      onTap: () {
                        checkValue = !checkValue;
                        print(checkValue);
                      },
                      value: checkValue,
                      text: "Make viewable for all users",
                    ),
                    addSpaceVertical(10),
                    ProjectCheckBox(
                      onTap: () {
                        checkValue = !checkValue;
                        print(checkValue);
                      },
                      value: checkValue,
                      text: "Make Private",
                    ),
                  ],
                ),
                ProjectButton(
                  text: "Add",
                  onPressed: () {
                    context.read<TodoBloc>().add(TodoAddEvent(
                        todo: Todo(
                            title: titileController.text,
                            decription: descController.text,
                            isDone: 0,
                            date: DateTime.now().toString())));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;
  const _CustomCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: ProjectColors.grey,
              borderRadius: BorderRadius.circular(8)),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            addSpaceHorizontal(20),
            Image.asset(
              imagePath,
              color: ProjectColors.purple,
              height: 25,
            ),
            addSpaceHorizontal(5),
            Text(title, style: Theme.of(context).textTheme.displaySmall)
          ]),
        ),
      ),
    );
  }
}
