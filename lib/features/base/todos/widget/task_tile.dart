// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

 import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';
import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';
import 'package:my_todo_app_with_bloc/product/model/todo_model.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';
import 'package:my_todo_app_with_bloc/product/widgets/checkbox/project_checkbox.dart';
import 'package:my_todo_app_with_bloc/product/widgets/text/project_label_text.dart';

class TodoTile extends StatelessWidget with _Decoration {
  final Todo todo;
  final VoidCallback onTap;
  const TodoTile({
    Key? key,
    required this.onTap,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        addSpaceVertical(5),
        Container(
            height: 140,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: returnDecoration(todo.isDone),
            child: Row(
              children: [
                ProjectCheckBox(
                  value: todo.isDone,
                  text: "",
                  onTap: onTap,
                ),
                addSpaceHorizontal(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectTextFieldLabelText(
                        text: todo.title, isLineThrough: todo.isDone),
                    SizedBox(
                      width: 250,
                      child: Text(
                        todo.decription,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                decoration: todo.isDone
                                    ? TextDecoration.lineThrough
                                    : null),
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                    addSpaceVertical(20),
                    const Spacer(),
                    addSpaceVertical(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InformationRow(
                          iconPath: ProjectIconPaths.date.path,
                          text: DateFormat("dd.MM.yyyy").format(
                            DateTime.parse(todo.date),
                          ),
                          isOpacity: todo.isDone,
                        ),
                        addSpaceHorizontal(30),
                        _InformationRow(
                          iconPath: ProjectIconPaths.time.path,
                          text: DateFormat.Hm().format(
                            DateTime.parse(todo.date),
                          ),
                          isOpacity: todo.isDone,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ))
      ]),
    );
  }
}

class _InformationRow extends StatelessWidget {
  final String iconPath;
  final String text;
  final bool isOpacity;
  const _InformationRow(
      {Key? key,
      required this.iconPath,
      required this.text,
      required this.isOpacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              iconPath,
              height: 25,
              color: isOpacity ? ProjectColors.darkGrey : null,
            ),
            addSpaceHorizontal(5),
            Text(
              text,
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        )
      ],
    );
  }
}

class _Decoration {
  BoxDecoration returnDecoration(bool isDone) {
    return BoxDecoration(
        color: ProjectColors.grey.withOpacity(isDone ? .3 : 1),
        borderRadius: BorderRadius.circular(5));
  }
}
