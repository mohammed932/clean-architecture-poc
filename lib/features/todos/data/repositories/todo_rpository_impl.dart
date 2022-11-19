import 'package:learn_clean_arch/core/errors/exception.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:learn_clean_arch/features/todos/data/datasources/remote/todos_remote_datasource.dart';
import 'package:learn_clean_arch/features/todos/domain/entities/todo_entity.dart';
import 'package:learn_clean_arch/features/todos/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodosRemoteDataSource todosRemoteDataSource;
  TodoRepositoryImpl({required this.todosRemoteDataSource});

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodos() async {
    try {
      final todos = await todosRemoteDataSource.getTodos();
      return Right(todos);
    } on ServerException catch (e) {
      return Left(ServerFailure(serverException: e));
    }
  }
}
