import 'package:equatable/equatable.dart';
import 'package:flutter_capacitaciones/modules/posts/data/model/m_posts.dart';

abstract class PostsState extends Equatable {
  const PostsState(
      {this.userId = -1, this.id = -1, this.title = "", this.body = ""});

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  @override
  List<Object?> get props => [userId, id, title, body];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Posts> posts;

  const PostsLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostsDeleted extends PostsState {
  final Posts? post;

  const PostsDeleted({required this.post});

  @override
  List<Object?> get props => [post];
}

class PostsError extends PostsState {
  final String message;

  const PostsError({required this.message});

  @override
  List<Object?> get props => [message];
}

class PostsFormState extends PostsState {
  final Posts post;

  const PostsFormState({required this.post});

  @override
  List<Object?> get props => [post];
}
