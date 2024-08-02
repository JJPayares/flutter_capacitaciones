import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_capacitaciones/modules/news/data/models/category.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';

Future<List<Noticia>> cargarNoticias() async {
  final String response = await rootBundle
      .loadString('lib/modules/news/data/repository/news_data.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Noticia.fromJson(json)).toList();
}

Future<List<Categoria>> cargarCategorias() async {
  final String response = await rootBundle
      .loadString('lib/modules/news/data/repository/categories_data.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Categoria.fromJson(json)).toList();
}
