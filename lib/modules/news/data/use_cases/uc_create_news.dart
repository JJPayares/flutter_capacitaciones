import 'dart:convert';
import 'dart:io';

import 'package:flutter_capacitaciones/base/use_case.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/r_news.dart';
import 'package:http/http.dart'as http;


class UcCreateNewsParams extends Params {
  final Map<String, String> body;
  final File? imageFile;

  UcCreateNewsParams({required this.body, this.imageFile});
}

class UcCreateNews extends UseCase<Noticia, UcCreateNewsParams> {
  final NewsRepository newsRepository;

  UcCreateNews({required this.newsRepository});

  @override
  Future<Noticia> call({UcCreateNewsParams? params}) async {
    final http.Response response =
        await newsRepository.createNews(params!.body, params.imageFile);

    switch (response.statusCode) {
      case 201:
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
