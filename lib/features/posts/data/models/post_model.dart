import 'package:learn_clean_arch/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required int id,
    required String title,
    required String body,
  }) : super(
          id: id,
          body: body,
          title: title,
        );
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

  toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
