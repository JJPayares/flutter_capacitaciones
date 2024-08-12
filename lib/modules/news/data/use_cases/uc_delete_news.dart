import 'dart:convert';
import 'package:flutter_capacitaciones/base/use_case.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/r_news.dart';
import "package:http/http.dart" as http;

class UcDeleteNewsParams extends Params {
  final String newsId;

  UcDeleteNewsParams({required this.newsId});
}

class UcDeleteNews extends UseCase<String, UcDeleteNewsParams> {
  final NewsRepository repository;

  UcDeleteNews({required this.repository});

  @override
  Future<String> call({UcDeleteNewsParams? params}) async {
    http.Response response = await repository.deleteNew(params!.newsId);

    switch (response.statusCode) {
      case 200:
        final deletedNews = json.decode(response.body);
        return deletedNews;
      default:
        throw UseCaseException("Ha ocurrido un error");
    }
  }
}
