import 'dart:convert';
import 'dart:io';
import 'package:flutter_capacitaciones/base/use_case.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/r_news.dart';
import 'package:http/http.dart' as http;

class UcUpdateNewsParams extends Params {
  final String newId;
  final Map<String, String> body;
  final File? imageFile;

  UcUpdateNewsParams({required this.newId, required this.body, this.imageFile});
}

class UcUpdateNews extends UseCase<Noticia, UcUpdateNewsParams> {
  final NewsRepository newsRepository;

  UcUpdateNews({required this.newsRepository});

  @override
  Future<Noticia> call({UcUpdateNewsParams? params}) async {
    final http.Response response = await newsRepository.updateNews(
        params!.newId, params.body, params.imageFile);

    switch (response.statusCode) {
      case 200:
        Noticia newNews =
            Noticia.fromJson(json.decode(utf8.decode(response.bodyBytes)));
        return newNews;
      case 404:
        throw UseCaseException(
            json.decode(utf8.decode(response.bodyBytes))["error"]);
      default:
        throw UseCaseException(
            "Hubo un error al momento de crear la noticia. Por favor contactar con el administrador.");
    }
  }
}
