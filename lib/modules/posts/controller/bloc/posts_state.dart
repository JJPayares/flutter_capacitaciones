import 'package:equatable/equatable.dart';
import 'package:flutter_capacitaciones/modules/posts/data/model/m_posts.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Posts> posts;

  const PostsLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostsError extends PostsState {
  final String message;

  const PostsError({required this.message});

  @override
  List<Object?> get props => [message];
}
