import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:learn_clean_arch/features/todos/domain/entities/todo_entity.dart';
import 'package:learn_clean_arch/features/todos/domain/usecases/get_todos.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final GetTodos getTodos;
  TodosBloc({required this.getTodos}) : super(TodosInitial()) {
    on<TodosEvent>(
      (event, emit) async {
        if (event is LoadTodos) {
          emit(TodosLoadingState());
          final response = await getTodos();

          response.fold(
            (failure) => emit(TodosErrorState(message: _mapFailureToMessage(failure))),
            (todos) => emit(TodosLoadedState(todos: todos)),
          );
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Please try again later .';

      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
