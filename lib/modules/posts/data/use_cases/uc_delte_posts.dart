import 'package:flutter_capacitaciones/base/use_case.dart';
import 'package:flutter_capacitaciones/modules/posts/data/model/m_posts.dart';
import 'package:flutter_capacitaciones/modules/posts/data/repository/r_posts.dart';
import "package:http/http.dart" as http;

class DeletePostUseCaseParams extends Params {
  final Posts? post;

  DeletePostUseCaseParams({this.post});
}

class DeletePostsUseCase extends UseCase<dynamic, DeletePostUseCaseParams> {
  DeletePostsUseCase({this.repository});
  final PostsRepository? repository;

  @override
  Future<Posts?> call({DeletePostUseCaseParams? params}) async {
    http.Response response =
        await repository?.deletePosts(idPost: params?.post?.id);
    switch (response.statusCode) {
      case 200:
        return params?.post;
      default:
        throw UseCaseException("Ha ocurrido un error");
    }
  }
}
