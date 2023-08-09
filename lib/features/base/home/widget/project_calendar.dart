import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app_with_bloc/product/constant/project_colors.dart';

final today = DateUtils.dateOnly(DateTime.now());

class ProjectCalender extends StatefulWidget {
  const ProjectCalender({super.key});

  @override
  State<ProjectCalender> createState() => _ProjectCalenderState();
}

class _ProjectCalenderState extends State<ProjectCalender> {
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, 1),
    DateTime(today.year, today.month, 5),
    DateTime(today.year, today.month, 14),
    DateTime(today.year, today.month, 17),
    DateTime(today.year, today.month, 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Calender",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.multi,
              dayTextStyle: Theme.of(context).textTheme.displayMedium,
              selectedDayTextStyle: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white),
              weekdayLabelTextStyle:
                  Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ProjectColors.purple,
                      ),
              selectedDayHighlightColor: Colors.indigo,
            ),
            value: _multiDatePickerValueWithDefaultValue,
            onValueChanged: (dates) =>
                setState(() => _multiDatePickerValueWithDefaultValue = dates),
          )
        ],
      ),
    );
  }
}
