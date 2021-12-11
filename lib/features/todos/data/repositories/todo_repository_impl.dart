import 'package:injectable/injectable.dart';
import 'package:todo/core/errors/exceptions.dart';
import 'package:todo/core/network/network_info.dart';
import 'package:todo/features/todos/data/datasources/todo_remote_datasource.dart';
import 'package:todo/features/todos/domain/entities/todo.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/domain/repositories/todo_repository.dart';

@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final NetworkInfo networkInfo;
  final TodoRemoteDataSource todoRemoteDataSource;

  TodoRepositoryImpl({
    required this.networkInfo,
    required this.todoRemoteDataSource,
  });

  @override
  Future<Either<Failure, Todo>> getTodos() async {
    networkInfo.isConnected;
    try {
      final todo = await todoRemoteDataSource.getTodoFromRemoteDataSource();
      return Right(todo);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
