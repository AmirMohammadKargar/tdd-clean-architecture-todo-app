import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/errors/exceptions.dart';
import 'package:todo/features/todos/data/datasources/todo_remote_datasource.dart';
import 'package:todo/features/todos/data/models/todo_models.dart';
import '../../../../fixtures/fixtrue_reader.dart';
import 'todo_remote_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late TodoRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = TodoRemoteDataSourceImpl(client: mockDio);
  });

  final tTodos = json.decode(fixture('todo.json'));
  final tTodosModel = TodoModel.fromJson(json.decode(fixture('todo.json')));

  group('getTodoRemoteDataSource', () {
    test(
      'should preform a GET request on a URL',
      () {
        when(mockDio.get(any)).thenAnswer((_) async => Response(
            data: tTodos,
            statusCode: 200,
            requestOptions: RequestOptions(
                path:
                    'https://run.mocky.io/v3/cdd00c8f-d64a-4411-914d-f1c9236c6710')));

        dataSource.getTodoFromRemoteDataSource();

        verify(mockDio.get(
          'https://run.mocky.io/v3/cdd00c8f-d64a-4411-914d-f1c9236c6710',
        ));
      },
    );
  });

  test(
    'should return Todo when the response code is 200 (success)',
    () async {
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
            data: tTodos,
            statusCode: 200,
            requestOptions: RequestOptions(
                path:
                    'https://run.mocky.io/v3/cdd00c8f-d64a-4411-914d-f1c9236c6710')),
      );

      final result = await dataSource.getTodoFromRemoteDataSource();

      expect(result, equals(tTodosModel));
    },
  );

  test(
    'should throw a ServerException when the response code is 404 or other',
    () async {
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
            data: "Something went wrong",
            statusCode: 404,
            requestOptions: RequestOptions(
                path:
                    'https://run.mocky.io/v3/cdd00c8f-d64a-4411-914d-f1c9236c6710')),
      );

      final call = dataSource.getTodoFromRemoteDataSource;

      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    },
  );
}
