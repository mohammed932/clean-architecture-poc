import 'package:dartz/dartz.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:learn_clean_arch/features/todos/domain/entities/todo_entity.dart';
import 'package:learn_clean_arch/features/todos/domain/repositories/todo_repository.dart';

class GetTodos {
  final TodoRepository todoRepo;
  GetTodos({required this.todoRepo});
  Future<Either<Failure, List<TodoEntity>>> call() async {
    return await todoRepo.getTodos();
  }
}
