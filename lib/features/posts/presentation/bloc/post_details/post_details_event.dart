part of 'post_details_bloc.dart';

abstract class PostDetailsEvent extends Equatable {
  const PostDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadPostDetails extends PostDetailsEvent {}
