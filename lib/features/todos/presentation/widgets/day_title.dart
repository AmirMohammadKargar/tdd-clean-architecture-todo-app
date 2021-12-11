import 'package:flutter/material.dart';
import 'package:todo/features/todos/data/models/date_model.dart';

class DayTitle extends StatelessWidget {
  const DayTitle({
    Key? key,
    required this.today,
  }) : super(key: key);
  final DateModel today;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          today.weekDay,
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          '${today.day} ${today.month},${today.year}',
          style: Theme.of(context).textTheme.headline2,
        )
      ],
    );
  }
}
