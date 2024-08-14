import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_event.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_state.dart';

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
              return Center(child: CircularProgressIndicator());
            } else if (state is PostsLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(post.title ?? ''),
                    subtitle: Text(post.body ?? ''),
                  );
                },
              );
            } else if (state is PostsError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('Presiona el botón para cargar posts'));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<PostsBloc>().add(FetchPosts()),
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
