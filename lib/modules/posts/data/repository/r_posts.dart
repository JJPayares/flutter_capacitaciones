import 'package:flutter_capacitaciones/base/repository.dart';
import 'package:http/http.dart' as http;

class PostsRepository extends BaseRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<http.Response> getPosts({int? idPost}) async {
    String url = baseUrl;
    if (idPost != null && idPost != -1) {
      url = '$baseUrl/$idPost';
    }

    return await http.Client().get(Uri.parse(url), headers: {});
  }

  dynamic deletePosts({int? idPost}) async {
    String url = baseUrl;
    if (idPost != null && idPost != -1) {
      url = '$baseUrl/$idPost';
    }
    return await http.Client().delete(Uri.parse(url), headers: {});
  }
}
