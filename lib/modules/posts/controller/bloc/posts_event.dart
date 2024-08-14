import 'package:equatable/equatable.dart';

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
  final dynamic idPost;

  const DeletePosts({this.idPost});

  @override
  List<Object?> get props => [idPost];
}
