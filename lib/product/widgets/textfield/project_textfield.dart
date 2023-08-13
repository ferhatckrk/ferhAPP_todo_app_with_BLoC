// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProjectTextField extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final double height;
  final String? errorText;
  final TextEditingController? controller;
  const ProjectTextField(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.height = 60,
      this.controller,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: errorText == null ? height : 85,
      child: TextField(
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.red),
          errorMaxLines: 2,
          hintText: hintText,
        ),
        onChanged: onChanged,
        controller: controller,
        expands: true,
        maxLines: null,
      ),
    );
  }
}
