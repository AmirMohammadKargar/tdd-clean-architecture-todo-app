import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/todos/domain/entities/date.dart';
import 'package:todo/features/todos/domain/entities/task.dart';
import 'package:todo/features/todos/domain/entities/todo.dart';
import 'package:todo/features/todos/domain/repositories/todo_repository.dart';
import 'package:todo/features/todos/domain/usecases/get_todos.dart';
import 'get_todos_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late GetTodos usecase;
  late MockTodoRepository mockTodoRepository;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = GetTodos(mockTodoRepository);
  });

  final task = TaskEntity(
      time: "09:00 AM",
      title: "Design team meeting",
      color: "0xFFEF5350",
      done: true);
  final date =
      DateEntity(year: "2021", month: "Feb", day: "3", weekDay: "sunday");

  final todos = Todo(tasks: [task], date: date);
  test(
    'should get todos from the repository',
    () async {
      when(mockTodoRepository.getTodos()).thenAnswer((_) async => Right(todos));

      final result = await usecase(NoParams());

      expect(result, Right(todos));

      verify(mockTodoRepository.getTodos());

      verifyNoMoreInteractions(mockTodoRepository);
    },
  );
}
