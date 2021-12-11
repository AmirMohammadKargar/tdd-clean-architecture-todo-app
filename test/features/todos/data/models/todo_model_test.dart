import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/todos/data/models/date_model.dart';
import 'package:todo/features/todos/data/models/task_model.dart';
import 'package:todo/features/todos/data/models/todo_models.dart';
import 'package:todo/features/todos/domain/entities/todo.dart';

import '../../../../fixtures/fixtrue_reader.dart';

void main() {
  final task = TaskModel(
      time: "09:00 AM",
      title: "Design team meeting",
      color: "0xFFEF5350",
      done: true);
  final date =
      DateModel(year: "2021", month: "Feb", day: "3", weekDay: "sunday");

  final tTodoModel = TodoModel(tasks: [task], date: date);

  test(
    'should be a subclass of Todo entity',
    () async {
      // assert
      expect(tTodoModel, isA<Todo>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON Todo is response',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('todo.json'));

        final result = TodoModel.fromJson(jsonMap);

        expect(result, tTodoModel);
      },
    );
  });
}
