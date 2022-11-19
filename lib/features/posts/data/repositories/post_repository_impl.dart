import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learn_clean_arch/core/errors/exception.dart';
import 'package:learn_clean_arch/features/posts/data/datasources/local/post_local_datasource.dart';
import 'package:learn_clean_arch/features/posts/data/datasources/remote/post_remote_datasource.dart';
import 'package:learn_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:learn_clean_arch/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;
  PostRepositoryImpl({required this.postRemoteDataSource, required this.postLocalDataSource});
  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      try {
        final posts = await postRemoteDataSource.getPosts();
        postLocalDataSource.cachePosts(posts); // store posts in cache
        return Right(posts);
      } on ServerException catch (e) {
        return Left(ServerFailure(serverException: e));
      }
    } else {
      try {
        final localPosts = await postLocalDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, PostEntity>> getPostDetails(int id) async {
    try {
      final posts = await postRemoteDataSource.getPostDetails(id);
      return Right(posts);
    } on ServerException catch (e) {
      return Left(ServerFailure(serverException: e));
    }
  }
}
