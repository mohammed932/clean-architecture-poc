import 'package:learn_clean_arch/features/todos/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    required int id,
    required String title,
  }) : super(
          id: id,
          title: title,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(id: json['id'], title: json['title']);
  }

  Map<String, dynamic> toJosn() {
    return {
      'id': id,
      'title': title,
    };
  }
}
