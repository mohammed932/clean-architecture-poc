import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_arch/core/blocs/generic_cubit/generic_cubit.dart';
import 'package:learn_clean_arch/core/errors/failure.dart';
import 'package:learn_clean_arch/core/utils.dart';
import 'package:learn_clean_arch/features/posts/domain/entities/post_entity.dart';
import 'package:learn_clean_arch/features/posts/domain/usecases/get_posts_usecase.dart';
import 'package:learn_clean_arch/features/posts/presentation/pages/post_details/post_details.imports.dart';
import 'package:learn_clean_arch/injection_container.dart' as di;

part 'posts_screen.dart';
part 'posts_data.dart';
