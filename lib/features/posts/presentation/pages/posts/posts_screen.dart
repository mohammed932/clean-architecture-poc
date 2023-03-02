part of 'posts.imports.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final PostsData _postsData = PostsData()..getPosts();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<GenericCubit<List<PostEntity>>, GenericCubitState<List<PostEntity>>>(
        bloc: _postsData.postsCubit,
        builder: (context, state) {
          if (state is GenericUpdatedState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(state.data[index].id.toString()),
                  title: Text(state.data[index].title),
                  subtitle: Text(state.data[index].title),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PostDetailsScreen(postId: state.data[index].id),
                    ));
                  },
                );
              },
            );
          } else if (state is GenericErrorState) {
            final error = Utils.tryCast<ServerFailure>(state.responseError);
            return Center(
              child: Text(error!.serverException.message),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
