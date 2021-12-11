part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class Loading extends TodoState {}

class Loaded extends TodoState {
  final Todo todo;

  const Loaded({required this.todo});
}

class Error extends TodoState {
  final String message;

  const Error({required this.message});
}
