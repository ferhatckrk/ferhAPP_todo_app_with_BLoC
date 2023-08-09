import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app_with_bloc/features/auth/meeting/bloc/meeting_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/_base/view/base_view.dart';
import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';
import 'package:my_todo_app_with_bloc/product/widgets/button/project_button.dart';

class MeetingView extends StatelessWidget {
  static const String routeName = '/meeting-view';
  const MeetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeetingBloc(),
      child: BlocConsumer<MeetingBloc, MeetingState>(
        listener: (context, state) {
          if (state is MeetingNavigateToBaseViewState) {
            Navigator.pushReplacementNamed(context, BaseView.routeName);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(
                      ProjectIconPaths.todo.path,
                      height: 80,
                    ),
                    Text(
                      "FerhApp",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "An app that keeps you and the family on schedule.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                ProjectButton(
                  onPressed: () {
                    context
                        .read<MeetingBloc>()
                        .add(MeetingNavigateToHomeEvent());
                  },
                  text: "Start",
                )
              ],
            )),
          );
        },
      ),
    );
  }
}
