part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class TodosLoadingState extends TodosState {}

class TodosErrorState extends TodosState {
  final String message;
  const TodosErrorState({required this.message});
}

class TodosLoadedState extends TodosState {
  final List<TodoEntity> todos;
  const TodosLoadedState({required this.todos});
  @override
  List<Object> get props => [todos];
}
