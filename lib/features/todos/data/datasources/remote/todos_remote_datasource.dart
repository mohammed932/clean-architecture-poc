import 'package:dio/dio.dart';
import 'package:learn_clean_arch/core/errors/exception.dart';
import 'package:learn_clean_arch/features/todos/data/models/todo_model.dart';

abstract class TodosRemoteDataSource {
  Future<List<TodoModel>> getTodos();
}

class TodosRemoteDataSourceImpl implements TodosRemoteDataSource {
  final Dio dio;
  TodosRemoteDataSourceImpl({required this.dio});
  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      var response = await dio.get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        // final List decodedJson = json.decode(response.data) as List;
        final List<TodoModel> todos = response.data.map<TodoModel>((json) => TodoModel.fromJson(json)).toList();
        return todos;
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw ServerException(
        endPointUrl: e.message,
        error: e.response?.data,
        message: e.message,
        statusCode: e.response!.statusCode!,
      );
    }
  }
}
