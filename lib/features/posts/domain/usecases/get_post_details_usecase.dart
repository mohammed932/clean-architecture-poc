import 'package:dartz/dartz.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:learn_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:learn_clean_arch/features/posts/domain/repositories/post_repository.dart';

class GetPostDetailsUsecase {
  final PostRepository postRepo;
  GetPostDetailsUsecase({required this.postRepo});
  Future<Either<Failure, PostEntity>> call(int id) async {
    return await postRepo.getPostDetails(id);
  }
}
