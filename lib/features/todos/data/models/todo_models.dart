import 'package:todo/features/todos/data/models/date_model.dart';
import 'package:todo/features/todos/data/models/task_model.dart';
import 'package:todo/features/todos/domain/entities/todo.dart';

// ignore: must_be_immutable
class TodoModel extends Todo {
  TodoModel({
    required List<TaskModel> tasks,
    required DateModel date,
  }) : super(
          tasks: tasks,
          date: date,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    _mapTasks(Map<String, dynamic> json) {
      var todos = <TaskModel>[];
      json["todos"].forEach((task) {
        todos.add(TaskModel.fromJson(task));
      });
      return todos;
    }

    return TodoModel(
      date: DateModel.fromJson(json['date']),
      tasks: _mapTasks(json),
    );
  }
}
