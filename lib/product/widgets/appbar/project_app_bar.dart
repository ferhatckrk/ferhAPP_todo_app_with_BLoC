import 'package:flutter/material.dart';
import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';
import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';

const adres =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png";

class ProjectAppBar extends AppBar {
  ProjectAppBar({super.key, required BuildContext context})
      : super(
            toolbarHeight: 120,
            elevation: 0.0,
            leading: Image.asset(
              ProjectIconPaths.drawer.path,
              height: 25,
              width: 25,
            ),
            title: Text("Home",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: ProjectColors.white, fontWeight: FontWeight.w600)),
            centerTitle: true,
            actions: [
              const CircleAvatar(
                backgroundImage: NetworkImage(adres, scale: 1),
              ),
              addSpaceHorizontal(10)
            ]);
}
