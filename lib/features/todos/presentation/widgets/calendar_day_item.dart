import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/core/theme/colors.dart';

class CalenderDayItem extends StatelessWidget {
  const CalenderDayItem({
    Key? key,
    required this.day,
    required this.isToday,
  }) : super(key: key);
  final DateTime day;
  final bool isToday;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0.w,
      decoration: BoxDecoration(
        color: isToday
            ? Theme.of(context).highlightColor
            : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 1.0.h,
        ),
        child: Column(
          children: <Widget>[
            Text(
              DateFormat('EEEE').format(day).substring(0, 3),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: isToday ? AppColor.textAccent : AppColor.textPrimary,
                  ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Text(
              day.day.toString(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: isToday ? AppColor.textAccent : AppColor.textPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
