import 'package:dartz/dartz.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:learn_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:learn_clean_arch/features/posts/domain/repositories/post_repository.dart';

class GetPostsUsecase {
  final PostRepository postRepo;
  GetPostsUsecase({required this.postRepo});
  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postRepo.getPosts();
  }
}
