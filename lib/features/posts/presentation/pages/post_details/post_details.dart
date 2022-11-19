part of 'post_details.imports.dart';

class PostDetailsScreen extends StatefulWidget {
  final int postId;
  const PostDetailsScreen({super.key, required this.postId});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final PostDetailsData _postDetailsData = PostDetailsData();
  @override
  void initState() {
    super.initState();
    _postDetailsData.getPostDetails(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('post details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<GenericCubit<PostEntity?>, GenericCubitState<PostEntity?>>(
          bloc: _postDetailsData.postDetailsCubit,
          builder: (context, state) {
            if (state is GenericUpdatedState) {
              return Column(
                children: [
                  Card(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      child: Text(state.data!.body),
                    ),
                  )
                ],
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
      ),
    );
  }
}
