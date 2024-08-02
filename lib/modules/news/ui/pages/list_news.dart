import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/repository.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/news_card.dart';

class ListNewsPage extends StatefulWidget {
  const ListNewsPage({super.key});

  @override
  State<ListNewsPage> createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  late Future<List<Noticia>> futureNoticias;
  // late Future<List<Categoria>> futureCategotiasl;

  @override
  void initState() {
    super.initState();
    futureNoticias = cargarNoticias();
    // futureCategotiasl = cargarCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureNoticias,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          log('List New: ${snapshot.error.toString()}');
          return const Center(child: Text('Error al cargar las noticias'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hay noticias disponibles'));
        } else {
          final noticias = snapshot.data!;
          return ListView.builder(
            itemCount: noticias.length,
            itemBuilder: (context, index) {
              final noticia = noticias[index];
              return NewsCard(
                imageUrl: noticia.imagen,
                title: noticia.titulo,
                date: noticia.fecha,
              );
            },
          );
        }
      },
    );
  }
}
