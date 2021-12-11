import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/errors/exceptions.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/network/network_info.dart';
import 'package:todo/features/todos/data/datasources/todo_remote_datasource.dart';
import 'package:todo/features/todos/data/models/date_model.dart';
import 'package:todo/features/todos/data/models/task_model.dart';
import 'package:todo/features/todos/data/models/todo_models.dart';
import 'package:todo/features/todos/data/repositories/todo_repository_impl.dart';
import 'todo_repository_impl_test.mocks.dart';

@GenerateMocks([TodoRemoteDataSource, NetworkInfo])
void main() {
  late TodoRepositoryImpl repository;
  late MockTodoRemoteDataSource mockTodoRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockTodoRemoteDataSource = MockTodoRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TodoRepositoryImpl(
        networkInfo: mockNetworkInfo,
        todoRemoteDataSource: mockTodoRemoteDataSource);
  });

  final task = TaskModel(
      time: "09:00 AM",
      title: "Design team meeting",
      color: "0xFFEF5350",
      done: true);
  final date =
      DateModel(year: "2021", month: "Feb", day: "3", weekDay: "sunday");

  final tTodoModel = TodoModel(tasks: [task], date: date);

  group('device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        when(mockTodoRemoteDataSource.getTodoFromRemoteDataSource())
            .thenAnswer((_) async => tTodoModel);

        final result = await repository.getTodos();

        verify(mockTodoRemoteDataSource.getTodoFromRemoteDataSource());
        expect(result, equals(Right(tTodoModel)));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        when(mockTodoRemoteDataSource.getTodoFromRemoteDataSource())
            .thenThrow(ServerException());

        final result = await repository.getTodos();

        verify(mockTodoRemoteDataSource.getTodoFromRemoteDataSource());

        expect(result, equals(Left(ServerFailure())));
      },
    );
  });
}
