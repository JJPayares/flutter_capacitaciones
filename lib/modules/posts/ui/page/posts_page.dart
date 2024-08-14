import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_event.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_state.dart';
import 'package:flutter_capacitaciones/modules/posts/ui/widget/w_post_card.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostsLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return PostCard(
                    post: post,
                    onDelete: () {
                      context
                          .read<PostsBloc>()
                          .add(DeletePosts(idPost: post.id));
                    },
                  );
                },
              );
            } else if (state is PostsError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Algo paso con la API. Presione para recargar.'),
                IconButton(
                    onPressed: () =>
                        context.read<PostsBloc>().add(const FetchPosts()),
                    icon: const Icon(Icons.refresh))
              ],
            ));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<PostsBloc>().add(FetchPosts()),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
