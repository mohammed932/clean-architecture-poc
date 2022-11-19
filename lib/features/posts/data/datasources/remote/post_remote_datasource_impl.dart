import 'package:learn_clean_arch/core/network/network_interface.dart';
import 'package:learn_clean_arch/features/posts/data/datasources/remote/post_remote_datasource.dart';
import 'package:learn_clean_arch/features/posts/data/models/post_model.dart';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final INetwork network;
  PostRemoteDataSourceImpl({required this.network});
  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await network.get('posts');
      final List<PostModel> posts = response.map<PostModel>((json) => PostModel.fromJson(json)).toList();
      return posts;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostModel> getPostDetails(int id) async {
    try {
      final response = await network.get('posts/$id');
      final PostModel post = PostModel.fromJson(response);
      return post;
    } catch (e) {
      rethrow;
    }
  }
}
