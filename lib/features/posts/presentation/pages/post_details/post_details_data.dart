part of 'post_details.imports.dart';

class PostDetailsData {
  GenericCubit<PostEntity?> postDetailsCubit = GenericCubit(null);

  getPostDetails(int postId) async {
    final response = await di.sl<GetPostDetailsUsecase>().call(postId);
    response.fold(
      (failure) => postDetailsCubit.onErrorState(failure),
      (post) => postDetailsCubit.onUpdateData(post),
    );
  }
}
