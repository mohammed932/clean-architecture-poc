import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:learn_clean_arch/core/errors/exception.dart';
import 'package:learn_clean_arch/features/posts/data/datasources/local/post_local_datasource.dart';
import 'package:learn_clean_arch/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cashedPosts = "CACHED_POSTS";

class PostLocalDataSourceImpl extends PostLocalDataSource {
  final SharedPreferences sharedPreferences;
  PostLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    List postModelsToJson = postModels.map((postModel) => postModel.toJson()).toList();
    sharedPreferences.setString(cashedPosts, json.encode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(cashedPosts);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> posts = decodeJsonData.map<PostModel>((postJson) => PostModel.fromJson(postJson)).toList();
      return Future.value(posts);
    } else {
      throw EmptyCacheException();
    }
  }
}
