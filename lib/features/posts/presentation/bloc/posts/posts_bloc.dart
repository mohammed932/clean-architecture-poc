import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:learn_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:learn_clean_arch/features/posts/domain/usecases/get_posts_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  GetPostsUsecase postsUsecase;
  PostsBloc({required this.postsUsecase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is LoadPosts) {
        emit(PostsLoadingState());
        final response = await postsUsecase();
        response.fold(
          (failure) => emit(PostsErrorState(message: _mapFailureToMessage(failure))),
          (posts) => emit(PostsLoadedState(posts: posts)),
        );
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Please try again later .';

      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
