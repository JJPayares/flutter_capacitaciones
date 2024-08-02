import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/category.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/repository.dart';
import 'package:flutter_capacitaciones/modules/news/ui/pages/list_news.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/base_text.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<Categoria>> futureCategory;

  @override
  void initState() {
    super.initState();
    futureCategory = cargarCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const BaseText(
          textTitle: 'News ',
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(240, 152, 177, 234),
      body: const ListNewsPage(),
    ));
  }
}
