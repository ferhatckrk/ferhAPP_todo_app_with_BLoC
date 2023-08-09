// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';

class ProjectButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ProjectButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 170,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: ProjectColors.white, fontSize: 18),
        ),
      ),
    );
  }
}
