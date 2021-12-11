import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/todos/data/models/date_model.dart';
import 'package:todo/features/todos/data/models/task_model.dart';
import 'package:todo/features/todos/data/models/todo_models.dart';
import 'package:todo/features/todos/domain/usecases/get_todos.dart';
import 'package:todo/features/todos/presentation/cubit/todo_cubit.dart';
import 'todo_bloc_test.mocks.dart';

@GenerateMocks([GetTodos])
void main() {
  late TodoCubit cubit;
  late MockGetTodos mockGetTodos;

  final task = TaskModel(
      time: "09:00 AM",
      title: "Design team meeting",
      color: "0xFFEF5350",
      done: true);
  final date =
      DateModel(year: "2021", month: "Feb", day: "3", weekDay: "sunday");

  final tTodoModel = TodoModel(tasks: [task], date: date);

  setUp(() {
    EquatableConfig.stringify = true;
    mockGetTodos = MockGetTodos();
    cubit = TodoCubit(mockGetTodos);
  });

  test('initialState', () {
    expect(cubit.state, equals(TodoInitial()));
  });

  blocTest<TodoCubit, TodoState>(
    'should emit [Loading,Loading] when event is call and successfully',
    build: () {
      when(mockGetTodos(any)).thenAnswer((_) async => Right(tTodoModel));

      return cubit;
    },
    act: (cubit) => cubit.getTodosEvent(),
    expect: () => [Loading(), Loaded(todo: tTodoModel)],
  );

  blocTest<TodoCubit, TodoState>(
    'should emit [Loading,Error] when event is call with error',
    build: () {
      when(mockGetTodos(any)).thenAnswer((_) async => Left(ServerFailure()));

      return cubit;
    },
    act: (cubit) => cubit.getTodosEvent(),
    expect: () => [Loading(), const Error(message: 'Server Failed')],
  );

  tearDown(() {
    cubit.close();
  });
}
