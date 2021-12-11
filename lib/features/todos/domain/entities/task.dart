import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TaskEntity extends Equatable {
  String time;
  String title;
  String color;
  bool done;

  TaskEntity({
    required this.time,
    required this.title,
    required this.color,
    required this.done,
  });

  @override
  List<Object?> get props => [time, title, color, done];
}
