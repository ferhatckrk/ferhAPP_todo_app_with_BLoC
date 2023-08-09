// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProjectTextField extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final double height;
  final TextEditingController? controller;
  const ProjectTextField(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.height = 60,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        decoration: InputDecoration(
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
