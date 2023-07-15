import 'package:flutter_test/flutter_test.dart';
import 'package:learn_clean_arch/core/network/network_interface.dart';
import 'package:learn_clean_arch/core/utils.dart';
import 'package:learn_clean_arch/features/posts/data/datasources/remote/post_remote_datasource_impl.dart';
import 'package:learn_clean_arch/features/posts/data/models/post_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_post_api_response_test.mocks.dart';

@GenerateMocks([INetwork])
void main() {
  final mockINetwork = MockINetwork();
  final PostRemoteDataSourceImpl dataSourceImpl = PostRemoteDataSourceImpl(network: mockINetwork);
  group('test post api response', () {
    test('post repository sucess', () async {
      PostModel tPost = PostModel(id: 1, body: "test body", title: "test title");
      int tNumber = 1;
      // arrange
      when(mockINetwork.get(any)).thenAnswer(
        (_) async {
          final response = Utils.loadJsonFile(filePath: 'test/post.json');
          return response;
        },
      );
      // act
      final result = dataSourceImpl.getPostDetails(tNumber);
      //assert
      expect(await result, equals(tPost));
    });
    test('post repository failure', () async {
      PostModel tPost = PostModel(id: 1, body: "test body", title: "test title");
      int tNumber = 1;
      // arrange
      when(mockINetwork.get(any)).thenAnswer(
        (_) async {
          final response = Utils.loadJsonFile(filePath: 'test/post.json');
          return response;
        },
      );
      // act
      final result = dataSourceImpl.getPostDetails(tNumber);
      //assert
      expect(await result, equals(tPost));
    });
  });
}
