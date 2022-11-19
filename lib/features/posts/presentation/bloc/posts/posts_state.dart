part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsErrorState extends PostsState {
  final String message;
  const PostsErrorState({required this.message});
}

class PostsLoadedState extends PostsState {
  final List<PostEntity> posts;
  const PostsLoadedState({required this.posts});
  @override
  List<Object> get props => [posts];
}
