import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_capacitaciones/modules/news/data/models/category.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';

Future<List<Noticia>> cargarNoticias(int? categoryId) async {
  final String response = await rootBundle
      .loadString('lib/modules/news/data/repository/news_data.json');

  final Map<String, dynamic> data = json.decode(response);

  final List<dynamic> noticiasJson = data['noticias'];

  return noticiasJson
      .map((json) => Noticia.fromJson(json))
      .where((noticia) => categoryId == null || noticia.categoria == categoryId)
      .toList();
}

Future<List<Categoria>> cargarCategorias() async {
  final String response = await rootBundle
      .loadString('lib/modules/news/data/repository/categories_data.json');
  final Map<String, dynamic> data = json.decode(response);
  final List<dynamic> categoriesJson = data['categorias'];
  return categoriesJson.map((json) => Categoria.fromJson(json)).toList();
}
