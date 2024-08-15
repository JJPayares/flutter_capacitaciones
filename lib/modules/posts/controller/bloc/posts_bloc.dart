import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_event.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_state.dart';
import 'package:flutter_capacitaciones/modules/posts/data/use_cases/uc_delte_posts.dart';
import 'package:flutter_capacitaciones/modules/posts/data/use_cases/uc_get_posts.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase? getPostsUseCase;
  final DeletePostsUseCase? deletePostsUseCase;

  PostsBloc({this.deletePostsUseCase, this.getPostsUseCase})
      : super(PostsInitial()) {
    on<FetchPosts>(_onFetchPosts);
    on<DeletePosts>(_onDeletePosts);
  }

  void _onFetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());

    try {
      final posts = await getPostsUseCase!();
      emit(PostsLoaded(posts: posts));
    } catch (e) {
      emit(PostsError(message: e.toString()));
    }
  }

  void _onDeletePosts(DeletePosts event, Emitter<PostsState> emit) async {
    try {
      await deletePostsUseCase?.call(
          params: DeletePostUseCaseParams(post: event.post));
      log("Se borrø el Post: ${event.post!.toJson()}");
      emit(PostsDeleted(post: event.post));
    } catch (e) {
      emit(PostsError(message: e.toString()));
    }
  }
}
