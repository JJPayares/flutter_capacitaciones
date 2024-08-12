import 'dart:convert';
import 'package:flutter_capacitaciones/base/use_case.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/r_news.dart';
import "package:http/http.dart" as http;

class UcGetNews extends UseCaseNoParams<Noticia> {
  UcGetNews({required this.repository});
  final NewsRepository repository;

  @override
  Future<Noticia> call() async {
    http.Response response = await repository.getNews();

    switch (response.statusCode) {
      case 200:
        final newsList = Noticia.fromJson(json.decode(response.body));
        return newsList;
      default:
        throw UseCaseException("Ha ocurrido un error");
    }
  }
}
