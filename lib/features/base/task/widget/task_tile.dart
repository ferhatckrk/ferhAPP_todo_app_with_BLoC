import 'package:flutter/material.dart';
import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';
import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';
import 'package:my_todo_app_with_bloc/product/widgets/checkbox/project_checkbox.dart';
import 'package:my_todo_app_with_bloc/product/widgets/text/project_label_text.dart';

class TaskTile extends StatelessWidget with _Decoration {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        addSpaceVertical(5),
        Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: returnDecoration(),
            child: Row(
              children: [
                ProjectCheckBox(
                  value: true,
                  text: "",
                  onTap: () {},
                ),
                addSpaceHorizontal(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProjectTextFieldLabelText(text: "Dentist"),
                    SizedBox(
                      width: 250,
                      child: Text(
                        "Dental cleaning & examining. Prescription for tooth ache from Dcotor ",
                        style: Theme.of(context).textTheme.displaySmall,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                    addSpaceVertical(20),
                    Row(
                      children: [
                        Image.asset(
                          ProjectIconPaths.location.path,
                          height: 25,
                          width: 25,
                        ),
                        addSpaceHorizontal(10),
                        SizedBox(
                          width: 200,
                          child: Text(
                            "Hauptsuder Straße 101, 22104 Hamburg",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ],
                    ),
                    addSpaceVertical(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InformationRow(
                          iconPath: ProjectIconPaths.date.path,
                          text: "27.05.2023",
                        ),
                        addSpaceHorizontal(30),
                        _InformationRow(
                          iconPath: ProjectIconPaths.time.path,
                          text: "11.15",
                        )
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
  const _InformationRow({
    Key? key,
    required this.iconPath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              iconPath,
              height: 25,
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
  BoxDecoration returnDecoration() {
    return BoxDecoration(
        color: ProjectColors.grey, borderRadius: BorderRadius.circular(5));
  }
}
