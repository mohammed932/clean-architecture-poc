import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_arch/features/posts/presentation/bloc/post_details/post_details_bloc.dart';
import 'package:learn_clean_arch/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:learn_clean_arch/features/posts/presentation/pages/posts/posts.imports.dart';
import 'package:learn_clean_arch/features/todos/presentation/bloc/todos_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
          create: (context) => di.sl<TodosBloc>()..add(LoadTodos()),
        ),
        // BlocProvider<PostsBloc>(
        //   create: (context) => di.sl<PostsBloc>()..add(LoadPosts()),
        // ),
        BlocProvider<PostDetailsBloc>(
          create: (context) => di.sl<PostDetailsBloc>()..add(LoadPostDetails()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PostsScreen(),
      ),
    );
  }
}
