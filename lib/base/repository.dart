import "dart:io";
import "package:http/http.dart" as http;
import 'package:http_parser/http_parser.dart';

class BaseRepository {
  final http.Client client;
  final String apiUrl = '';

  BaseRepository({http.Client? client}) : client = client ?? http.Client();

  Future<http.Response> get(
    String url,
    Map<String, String>? headers,
  ) async {
    return client.get(Uri.parse("$apiUrl$url"), headers: headers ?? {});
  }

  Future<http.Response> post(
    String url,
    Map<String, dynamic> body,
    Map<String, String>? headers,
  ) async {
    return client.post(Uri.parse("$apiUrl$url"),
        body: body, headers: headers ?? {});
  }

  Future<http.Response> sendWithImage({
    required String url,
    required Map<String, String> body,
    required File? imageFile,
    required String imageName,
    required Map<String, String>? headers,
    required String? method,
  }) async {
    final Uri uri = Uri.parse("$apiUrl$url");
    http.MultipartRequest request =
        http.MultipartRequest(method ?? 'POST', uri);

    body.forEach((key, value) {
      request.fields[key] = value;
    });

    if (imageFile != null) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        imageName,
        imageFile.path,
        contentType: MediaType("image", "jpeg"),
      );
      request.files.add(multipartFile);
    }

    if (headers != null) {
      request.headers.addAll(headers);
    }

    var streamedResponse = await request.send();

    return http.Response.fromStream(streamedResponse);
  }

  Future<http.Response> put(String url, Map<String, dynamic> body,
      Map<String, String>? headers) async {
    return client.put(Uri.parse("$apiUrl$url"), body: body, headers: headers);
  }

  Future<http.Response> delete(String url) async {
    return client.delete(Uri.parse(url));
  }
}
