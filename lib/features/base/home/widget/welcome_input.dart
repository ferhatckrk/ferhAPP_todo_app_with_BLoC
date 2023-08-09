import 'package:flutter/material.dart';
import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';

class WelcomeInput extends StatelessWidget {
  final TextEditingController controller;
  final dynamic onChanged;
  WelcomeInput({
    required this.controller,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.w700),
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        ProjectIconPaths.search.path,
                        height: 20,
                      ),
                    ),
                    //  addSpaceHorizontal(5),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(ProjectIconPaths.add.path),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
