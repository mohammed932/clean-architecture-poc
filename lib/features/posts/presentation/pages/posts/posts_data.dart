part of 'posts.imports.dart';

class PostsData {
  GenericCubit<List<PostEntity>> postsCubit = GenericCubit([]);

  getPosts() async {
    final response = await di.sl<GetPostsUsecase>().call();
    response.fold(
      (failure) => postsCubit.onErrorState(failure),
      (posts) => postsCubit.onUpdateData(posts),
    );
  }
}
