// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProjectTextFieldLabelText extends StatelessWidget {
  final String text;
  final bool isLineThrough;
  const ProjectTextFieldLabelText(
      {Key? key, required this.text, this.isLineThrough = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
          fontWeight: FontWeight.bold,
          decoration: isLineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
