import 'package:flutter_capacitaciones/base/repository.dart';
import 'package:http/http.dart' as http;

class PostsRepository extends BaseRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<http.Response> getPosts() async {
    String url = baseUrl;
    return await http.Client().get(Uri.parse(url), headers: {});
  }
}
