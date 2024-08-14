import 'dart:convert';
import 'package:flutter_capacitaciones/base/use_case.dart';
import 'package:flutter_capacitaciones/modules/posts/data/model/m_posts.dart';
import 'package:flutter_capacitaciones/modules/posts/data/repository/r_posts.dart';
import "package:http/http.dart" as http;

class GetPostUseCaseParams extends Params {
  final int? idPost;

  GetPostUseCaseParams({this.idPost});
}

class GetPostsUseCase extends UseCase<List<Posts>, GetPostUseCaseParams> {
  GetPostsUseCase({required this.repository});
  final PostsRepository repository;

  @override
  Future<List<Posts>> call({GetPostUseCaseParams? params}) async {
    http.Response response = await repository.getPosts(
        idPost: params?.idPost != null ? params!.idPost : -1);

    switch (response.statusCode) {
      case 200:
        return Posts.postsFromJson(utf8.decode(response.bodyBytes));
      default:
        throw UseCaseException("Ha ocurrido un error");
    }
  }
}
