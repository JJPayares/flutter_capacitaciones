import 'package:equatable/equatable.dart';
import 'package:flutter_capacitaciones/modules/posts/data/model/m_posts.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object?> get props => [];
}

class FetchPosts extends PostsEvent {
  final int? idPost;

  const FetchPosts({this.idPost});
}

class DeletePosts extends PostsEvent {
  final Posts? post;

  const DeletePosts({this.post});

  @override
  List<Object?> get props => [post];
}
