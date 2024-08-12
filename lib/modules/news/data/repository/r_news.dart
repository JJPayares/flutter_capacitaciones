import 'dart:io';

import 'package:flutter_capacitaciones/base/repository.dart';
import 'package:http/http.dart' as http;

class NewsRepository extends BaseRepository {
  Future<http.Response> getNews() async {
    http.Response response = await get('/news/list/', {});
    return response;
  }

  Future<http.Response> getNewsDetail(String newsId) async {
    http.Response response = await get('/news/detail/$newsId', {});
    return response;
  }

  Future<http.Response> createNews(
    Map<String, String> body,
    File? imageFile,
  ) async {
    return await sendWithImage(
      url: "/news/create/",
      body: body,
      imageFile: imageFile,
      imageName: "photo",
      headers: {},
      method: "POST",
    );
  }

  Future<http.Response> updateNews(
    String newsId,
    Map<String, String> body,
    File? imageFile,
  ) async {
    return await sendWithImage(
      url: "/news/update/$newsId",
      body: body,
      imageFile: imageFile,
      imageName: "photo",
      headers: {},
      method: "PUT",
    );
  }

  Future<http.Response> deleteNew(String newsId) async {
    http.Response response = await delete('/news/delete/$newsId');
    return response;
  }
}
