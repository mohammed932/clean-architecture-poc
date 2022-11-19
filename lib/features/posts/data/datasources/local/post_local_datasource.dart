import 'package:dartz/dartz.dart';
import 'package:learn_clean_arch/features/posts/data/models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}
