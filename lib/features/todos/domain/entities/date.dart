import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DateEntity extends Equatable {
  String year;
  String month;
  String day;
  String weekDay;

  DateEntity({
    required this.year,
    required this.month,
    required this.day,
    required this.weekDay,
  });

  @override
  List<Object?> get props => [year, month, day, weekDay];
}
