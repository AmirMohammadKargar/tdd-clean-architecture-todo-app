import 'package:intl/intl.dart';
import 'package:todo/features/todos/domain/entities/date.dart';

// ignore: must_be_immutable
class DateModel extends DateEntity {
  DateModel({
    required String year,
    required String month,
    required String day,
    required String weekDay,
  }) : super(
          year: year,
          month: month,
          day: day,
          weekDay: weekDay,
        );

  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      year: json['year'],
      month: json['month'],
      day: json['day'],
      weekDay: json['week_day'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "year": year,
      "month": month,
      "day": day,
      "week_day": weekDay,
    };
  }

  String get ddMMyyyy => '$month $day, $year';

  DateTime get dateTime => DateFormat("MMM dd, yyyy").parse(ddMMyyyy);
}
