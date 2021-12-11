import 'package:dartz/dartz.dart';

import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/todos/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, Todo>> getTodos();
}
