import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/constant/urls.dart';
import 'package:todo/core/errors/exceptions.dart';
import 'package:todo/features/todos/data/models/todo_models.dart';

abstract class TodoRemoteDataSource {
  Future<TodoModel> getTodoFromRemoteDataSource();
}

@Injectable(as: TodoRemoteDataSource)
class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final Dio client;

  TodoRemoteDataSourceImpl({required this.client});

  @override
  Future<TodoModel> getTodoFromRemoteDataSource() async {
    final response = await client.get("$TODO_LIST");
    if (response.statusCode == 200) {
      return TodoModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
