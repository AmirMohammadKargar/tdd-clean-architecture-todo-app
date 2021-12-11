import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/todos/data/models/date_model.dart';
import 'package:todo/features/todos/domain/entities/date.dart';

import '../../../../fixtures/fixtrue_reader.dart';

void main() {
  final tDateModel =
      DateModel(year: "2021", month: "Feb", day: "3", weekDay: "sunday");

  test(
    'should be a subclass of Date entity',
    () async {
      // assert
      expect(tDateModel, isA<DateEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON Date is response',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('date.json'));

        final result = DateModel.fromJson(jsonMap);

        expect(result, tDateModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON from Date Model',
      () async {
        final result = tDateModel.toJson();

        final expectedJson = {
          "year": "2021",
          "month": "Feb",
          "day": "3",
          "week_day": "sunday"
        };

        expect(result, expectedJson);
      },
    );
  });
}
