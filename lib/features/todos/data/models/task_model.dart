import 'package:todo/features/todos/domain/entities/date.dart';
import 'package:todo/features/todos/domain/entities/task.dart';

// ignore: must_be_immutable
class TaskModel extends TaskEntity {
  TaskModel({
    required String time,
    required String title,
    required String color,
    required bool done,
  }) : super(
          time: time,
          title: title,
          color: color,
          done: done,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      time: json['time'],
      title: json['title'],
      color: json['color'],
      done: json['done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "time": time,
      "title": title,
      "color": color,
      "done": done,
    };
  }
}
