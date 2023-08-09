import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app_with_bloc/features/auth/meeting/view/meeting_view.dart';
import 'package:my_todo_app_with_bloc/features/auth/welcome/bloc/welcome_bloc.dart';
import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';
import 'package:my_todo_app_with_bloc/product/constant/image_path.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';
import 'package:my_todo_app_with_bloc/product/widgets/welcome_billboard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({super.key});

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: BlocConsumer<WelcomeBloc, WelcomeState>(
        listener: (context, state) {
          if (state is WelcomeIncrementState) {
            pageController.animateToPage(state.pageCount,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          } else if (state is WelcomeNavigateToMeetingPageState) {
            Navigator.pushReplacementNamed(context, MeetingView.routeName);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  addSpaceVertical(50),
                  _IndicatorAndCrossIcon(controller: pageController),
                  addSpaceVertical(50),
                  SizedBox(
                    height: size.height * 0.6,
                    child: PageView(
                      controller: pageController,
                      children: [
                        WelcomeBillBoard(
                          title: "Family Calender",
                          description:
                              "Plan your day together with your family without having to ask them.",
                          imagePath: ProjectImagePath.welcome1.path,
                        ),
                        WelcomeBillBoard(
                          title: "Task Management",
                          description:
                              "Manage your task together with your family and dont miss your schedules",
                          imagePath: ProjectImagePath.welcome2.path,
                        ),
                        WelcomeBillBoard(
                          title: "Events Calender",
                          description:
                              "Be informed about your families schedules.",
                          imagePath: ProjectImagePath.welcome3.path,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        if (state.pageCount < 2) {
                          context
                              .read<WelcomeBloc>()
                              .add(WelcomeIncrementEvent());
                        } else {
                          context
                              .read<WelcomeBloc>()
                              .add(WelcomeNavigateToMeetingPageEvent());
                        }
                      },
                      child: Image.asset(ProjectIconPaths.arrow.path))
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}

class _IndicatorAndCrossIcon extends StatelessWidget {
  const _IndicatorAndCrossIcon({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SmoothPageIndicator(
            controller: controller, // PageController
            count: 3,
            effect: const ExpandingDotsEffect(
                dotHeight: 5,
                expansionFactor: 5,
                dotWidth: 7,
                strokeWidth: 5,
                offset: 5,
                activeDotColor: Colors.black), // your preferred effect
            onDotClicked: (index) {}),
        GestureDetector(
          child: Image.asset(ProjectIconPaths.exit.path),
          onTap: () {
            context
                .read<WelcomeBloc>()
                .add(WelcomeNavigateToMeetingPageEvent());
          },
        )
      ]),
    );
  }
}
