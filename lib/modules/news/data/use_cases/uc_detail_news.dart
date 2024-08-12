import 'dart:convert';
import 'package:flutter_capacitaciones/base/use_case.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/r_news.dart';
import "package:http/http.dart" as http;

class UcDetailNewsParams extends Params {
  final String newsId;

  UcDetailNewsParams({required this.newsId});
}

class UcDetailNews extends UseCase<Noticia, UcDetailNewsParams> {
  final NewsRepository repository;

  UcDetailNews({required this.repository});

  @override
  Future<Noticia> call({UcDetailNewsParams? params}) async {
    http.Response response = await repository.getNewsDetail(params!.newsId);

    switch (response.statusCode) {
      case 200:
        final newsDetail = Noticia.fromJson(json.decode(response.body));
        return newsDetail;
      default:
        throw UseCaseException("Ha ocurrido un error");
    }
  }
}
