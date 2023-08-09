// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';

class ProjectCheckBox extends StatelessWidget with _ReturnDecoration {
  final bool value;
  final String text;
  final VoidCallback onTap;
  ProjectCheckBox({
    Key? key,
    required this.value,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 15,
            width: 15,
            decoration: returnMainDecoration(),
            child: value
                ? Container(
                    height: 7,
                    width: 7,
                    color: ProjectColors.purple,
                  )
                : null,
          ),
        ),
        addSpaceHorizontal(5),
        Text(
          text,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}

class _ReturnDecoration {
  BoxDecoration returnMainDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      border: Border.all(color: ProjectColors.purple, width: 1),
    );
  }
}
