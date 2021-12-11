import 'package:flutter/material.dart';
import 'package:todo/features/todos/data/models/date_model.dart';
import 'package:todo/features/todos/presentation/widgets/calendar_day_item.dart';

class Calender extends StatelessWidget {
  const Calender({
    Key? key,
    required this.today,
  }) : super(key: key);
  final DateModel today;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
          7,
          (index) => CalenderDayItem(
            day: today.dateTime.add(Duration(days: index)),
            isToday: index == 0,
          ),
        )
      ],
    );
  }
}
