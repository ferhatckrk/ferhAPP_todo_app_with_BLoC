// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app_with_bloc/features/base/_base/bloc/base_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/add_todo/bloc/add_todo_bloc.dart';
import 'package:my_todo_app_with_bloc/features/base/todos/bloc/todos_bloc.dart';
import 'package:my_todo_app_with_bloc/product/constant/icon_paths.dart';
import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';
import 'package:my_todo_app_with_bloc/product/enum/enum.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_functions.dart';
import 'package:my_todo_app_with_bloc/product/utils/project_scnackbar.dart';
import 'package:my_todo_app_with_bloc/product/widgets/button/project_button.dart';
import 'package:my_todo_app_with_bloc/product/widgets/text/project_label_text.dart';
import 'package:my_todo_app_with_bloc/product/widgets/textfield/project_textfield.dart';

class AddTodoView extends StatelessWidget {
  static const String routeName = '/addTaskView';
  AddTodoView({super.key});

  final double baseHeight = 10;

  bool checkValue = false;
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddTodoBloc>();
    return BlocConsumer<AddTodoBloc, AddTodoState>(
      listener: (context, state) {
        if (state is AddTodoShowTimePickerState) {
          showTimePicker(context: context, initialTime: TimeOfDay.now()).then(
            (value) => context.read<AddTodoBloc>().add(
                  AddTodoPickedTimeEvent(
                    timeOfDay:
                        (value ?? TimeOfDay.now()).format(context).toString(),
                  ),
                ),
          );
        } else if (state is AddTodoShowDatePickerState) {
          showDatePicker(
                  context: context,
                  initialDate: bloc.todo.date.isEmpty
                      ? DateTime.now()
                      : DateTime.parse(bloc.todo.date),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030))
              .then((value) => bloc.add(AddTodoPickedDateEvent(
                  date: (value ?? DateTime.now()).toString())));
        } else if (state is AddTodoSavedTodoState) {
          showSnackBar(
              context: context,
              message: "${state.todo.title} is saved",
              type: EnumSnackBarType.success,
              action: SnackBarAction(
                  label: "See Details",
                  onPressed: () {
                    context
                        .read<BaseBloc>()
                        .add(const BasePageIndexChangedEvent(pageIndex: 1));
                    context.read<TodosBloc>().add(TodosLoadAllTodosEvent());
                  }));
        }
      },
      builder: (context, state) => Scaffold(
        body: GestureDetector(
          onTap: () => closeFocus(),
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProjectTextFieldLabelText(
                    text: "Title",
                  ),
                  addSpaceVertical(baseHeight),
                  ProjectTextField(
                    hintText: "Write title of your schdedule!",
                    controller: titleController,
                    onChanged: (value) {
                      context
                          .read<AddTodoBloc>()
                          .add(AddTodoTitleChangedEvent(value));
                    },
                    errorText: (state is AddTodoErrorState)
                        ? state.titleTextError
                        : null,
                  ),
                  addSpaceVertical(baseHeight),
                  const ProjectTextFieldLabelText(
                    text: "Description",
                  ),
                  addSpaceVertical(baseHeight),
                  ProjectTextField(
                    hintText: "Detailed Information",
                    height: 200,
                    controller: descController,
                    onChanged: (value) {
                      context
                          .read<AddTodoBloc>()
                          .add(AddTodoDescriptionChangedEvent(value));
                    },
                  ),
                  addSpaceVertical(baseHeight),
                  const ProjectTextFieldLabelText(text: "Date & Time"),
                  addSpaceVertical(baseHeight),
                  Row(
                    children: [
                      _CustomCard(
                        imagePath: ProjectIconPaths.date.path,
                        title: bloc.todo.date.isEmpty
                            ? 'Pick Date'
                            : DateFormat("dd.MM.yyyy")
                                .format(DateTime.parse(bloc.todo.date)),
                        onTap: () => context
                            .read<AddTodoBloc>()
                            .add(const AddTodoShowDatePickerEvent()),
                      ),
                      addSpaceHorizontal(20),
                      _CustomCard(
                        imagePath: ProjectIconPaths.time.path,
                        title: bloc.todo.time.isEmpty
                            ? 'Pick time'
                            : bloc.todo.time,
                        onTap: () => context
                            .read<AddTodoBloc>()
                            .add(const AddTodoShowTimePickerEvent())
                        /*     final value = _showTimePicker(context); */
                        ,
                      ),
                    ],
                  ),
                  addSpaceVertical(20),
                  ProjectButton(
                    text: "Add",
                    onPressed: () {
                      context.read<AddTodoBloc>().add(AddTodoSaveTodoEvet());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;
  const _CustomCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: ProjectColors.grey,
              borderRadius: BorderRadius.circular(8)),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            addSpaceHorizontal(20),
            Image.asset(
              imagePath,
              color: ProjectColors.purple,
              height: 25,
            ),
            addSpaceHorizontal(5),
            Text(title, style: Theme.of(context).textTheme.displaySmall)
          ]),
        ),
      ),
    );
  }
}
