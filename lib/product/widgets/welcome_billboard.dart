// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';

class WelcomeBillBoard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const WelcomeBillBoard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          addSpaceVertical(20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(),
          ),
          addSpaceVertical(30),
          Image.asset(
            imagePath,
          ),
        ],
      ),
    );
  }
}
