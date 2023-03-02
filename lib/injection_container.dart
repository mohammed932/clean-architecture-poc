import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_clean_arch/core/network/dio_helper.dart';
import 'package:learn_clean_arch/features/posts/data/repositories/post_repository_impl.dart';
import 'package:learn_clean_arch/features/posts/domain/repositories/post_repository.dart';
import 'package:learn_clean_arch/features/posts/domain/usecases/get_post_details_usecase.dart';
import 'package:learn_clean_arch/features/posts/domain/usecases/get_posts_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/posts/data/datasources/local/post_local_datasource.dart';
import 'features/posts/data/datasources/local/post_local_datasource_impl.dart';
import 'features/posts/data/datasources/remote/post_remote_datasource.dart';
import 'features/posts/data/datasources/remote/post_remote_datasource_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Usecases
  sl.registerLazySingleton(() => GetPostsUsecase(postRepo: sl()));
  sl.registerLazySingleton(() => GetPostDetailsUsecase(postRepo: sl()));
  // Repository
  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postRemoteDataSource: sl(), postLocalDataSource: sl()));
  // Datasources
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(network: DioHelper()));
  sl.registerLazySingleton<PostLocalDataSource>(() => PostLocalDataSourceImpl(sharedPreferences: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DioHelper());
  sl.registerLazySingleton(() => Dio());
}
