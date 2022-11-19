part of 'post_details_bloc.dart';

abstract class PostDetailsState extends Equatable {
  const PostDetailsState();

  @override
  List<Object> get props => [];
}

class PostDetailsInitial extends PostDetailsState {}

class PostDetailsLoadingState extends PostDetailsState {}

class PostDetailsErrorState extends PostDetailsState {
  final Failure error;
  const PostDetailsErrorState({required this.error});
}

class PostDetailsLoadedState extends PostDetailsState {
  final PostEntity post;
  const PostDetailsLoadedState({required this.post});
  @override
  List<Object> get props => [post];
}
