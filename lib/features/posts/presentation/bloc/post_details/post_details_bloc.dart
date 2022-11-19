import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:learn_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:learn_clean_arch/features/posts/domain/usecases/get_post_details_usecase.dart';

part 'post_details_event.dart';
part 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  GetPostDetailsUsecase postDetailsUseCase;
  PostDetailsBloc({required this.postDetailsUseCase}) : super(PostDetailsInitial()) {
    on<PostDetailsEvent>((event, emit) async {
      if (event is LoadPostDetails) {
        emit(PostDetailsLoadingState());
        final response = await postDetailsUseCase(1);
        response.fold(
          (failure) => emit(PostDetailsErrorState(error: failure)),
          (post) => emit(PostDetailsLoadedState(post: post)),
        );
      }
    });
  }
}
