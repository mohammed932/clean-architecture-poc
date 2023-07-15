import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_clean_arch/core/errors/exception.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:learn_clean_arch/features/posts/data/datasources/local/post_local_datasource.dart';
import 'package:learn_clean_arch/features/posts/data/datasources/remote/post_remote_datasource.dart';
import 'package:learn_clean_arch/features/posts/data/models/post_model.dart';
import 'package:learn_clean_arch/features/posts/data/repositories/post_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_reporitory_test.mocks.dart';

@GenerateMocks([PostRemoteDataSource, PostLocalDataSource])
void main() {
  PostRepositoryImpl repository;
  final mockRemoteDataSource = MockPostRemoteDataSource();
  final mockLocalDataSource = MockPostLocalDataSource();
  repository = PostRepositoryImpl(
    postRemoteDataSource: mockRemoteDataSource,
    postLocalDataSource: mockLocalDataSource,
  );
  group('test posts repository', () {
    group('test single post', () {
      test('get single post', () async {
        PostModel tPost = PostModel(id: 1, body: "test body", title: "test body");
        int tNumber = 1;
        // arrange
        when(mockRemoteDataSource.getPostDetails(tNumber)).thenAnswer((_) async {
          final response = tPost;
          return response;
        });
        // act
        final result = await repository.getPostDetails(tNumber);
        // assert
        expect(result, equals(Right(tPost)));
      });

      test('get single post failure', () async {
        int tNumber = 1;
        ServerException serverException = ServerException(
          endPointUrl: '',
          error: '',
          message: 'error message',
          statusCode: 500,
        );
        // arrange
        when(mockRemoteDataSource.getPostDetails(tNumber)).thenThrow(serverException);
        // act
        final result = await repository.getPostDetails(tNumber);
        // assert
        expect(result, equals(Left(ServerFailure(serverException: serverException))));
      });
    });

    group('test posts', () {
      List<PostModel> tPosts = [
        PostModel(id: 1, body: "test body1", title: "test title1"),
        PostModel(id: 2, body: "test body2", title: "test title2"),
        PostModel(id: 3, body: "test body3", title: "test title3"),
      ];
      test('get list of posts', () async {
        /** mock cachePosts */
        when(mockLocalDataSource.cachePosts(tPosts)).thenAnswer((_) async {
          return Future.value(unit);
        });
        /** mock posts list */
        when(mockRemoteDataSource.getPosts()).thenAnswer((_) async {
          List<PostModel> posts = tPosts;
          return posts;
        });
        // act
        final result = await repository.getPosts();
        // assert
        expect(result, equals(Right(tPosts)));
      });
    });
  });
}
