import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/todos/data/models/task_model.dart';
import 'package:todo/features/todos/domain/entities/task.dart';

import '../../../../fixtures/fixtrue_reader.dart';

void main() {
  final tTaskModel = TaskModel(
      time: "09:00 AM",
      title: "Design team meeting",
      color: "0xFFEF5350",
      done: true);

  test(
    'should be a subclass of Task entity',
    () async {
      // assert
      expect(tTaskModel, isA<TaskEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON Task is response',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('task.json'));

        final result = TaskModel.fromJson(jsonMap);

        expect(result, tTaskModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON from Task Model',
      () async {
        final result = tTaskModel.toJson();

        final expectedJson = {
          "time": "09:00 AM",
          "title": "Design team meeting",
          "color": "0xFFEF5350",
          "done": true
        };

        expect(result, expectedJson);
      },
    );
  });
}
