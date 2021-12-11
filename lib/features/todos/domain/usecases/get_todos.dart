import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/todos/domain/entities/todo.dart';
import 'package:todo/features/todos/domain/repositories/todo_repository.dart';

@injectable
class GetTodos extends UseCase<Todo, NoParams> {
  final TodoRepository todoRepository;

  GetTodos(this.todoRepository);

  @override
  Future<Either<Failure, Todo>> call(NoParams params) async {
    return await todoRepository.getTodos();
  }
}
