import 'dart:convert';
import 'dart:developer';
import 'package:flutter_capacitaciones/base/use_case.dart';
import 'package:flutter_capacitaciones/modules/posts/data/model/m_posts.dart';
import 'package:flutter_capacitaciones/modules/posts/data/repository/r_posts.dart';
import "package:http/http.dart" as http;

class DeletePostUseCaseParams extends Params {
  final int? idPost;

  DeletePostUseCaseParams({this.idPost});
}

class DeletePostsUseCase extends UseCase<dynamic, DeletePostUseCaseParams> {
  DeletePostsUseCase({required this.repository});
  final PostsRepository repository;

  @override
  Future<http.Response> call({DeletePostUseCaseParams? params}) async {
    http.Response response =
        await repository.deletePosts(idPost: params?.idPost);
    log('Delete post Use Case: ${response.body}');

    switch (response.statusCode) {
      case 200:
        return response;
      // return Posts.postsFromJson(utf8.decode(response.bodyBytes));
      default:
        throw UseCaseException("Ha ocurrido un error");
    }
  }
}
