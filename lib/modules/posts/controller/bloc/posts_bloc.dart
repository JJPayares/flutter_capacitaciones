import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_event.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_state.dart';
import 'package:flutter_capacitaciones/modules/posts/data/use_cases/uc_get_posts.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase getPostsUseCase;

  PostsBloc({required this.getPostsUseCase}) : super(PostsInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  void _onFetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());

    try {
      final posts = await getPostsUseCase();
      emit(PostsLoaded(posts: posts));
    } catch (e) {
      emit(PostsError(message: e.toString()));
    }
  }
}
