import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/todos/domain/entities/todo.dart';
import 'package:todo/features/todos/domain/usecases/get_todos.dart';

part 'todo_state.dart';

@injectable
class TodoCubit extends Cubit<TodoState> {
  final GetTodos getTodos;
  TodoCubit(this.getTodos) : super(TodoInitial());

  void getTodosEvent() async {
    emit(Loading());
    Either<Failure, Todo> result = await getTodos(NoParams());
    result.fold(
      (failure) => emit(const Error(message: 'Server Failed')),
      (todos) => emit(Loaded(todo: todos)),
    );
  }
}
