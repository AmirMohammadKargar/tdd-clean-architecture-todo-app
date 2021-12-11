import 'package:equatable/equatable.dart';
import 'package:todo/features/todos/domain/entities/date.dart';
import 'package:todo/features/todos/domain/entities/task.dart';

// ignore: must_be_immutable
class Todo extends Equatable {
  List<TaskEntity> tasks;
  DateEntity date;

  Todo({required this.tasks, required this.date});

  @override
  List<Object?> get props => [tasks, date];
}
