import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/category.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/repository.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/custom_tap_bar.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/news_card.dart';

class ListNewsPage extends StatefulWidget {
  const ListNewsPage({
    super.key,
  });

  @override
  State<ListNewsPage> createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  late Future<List<Noticia>> futureNoticias;
  late Future<List<Categoria>> futureCategoria;
  Categoria? selectedCategory;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureNoticias = cargarNoticias(null);
    futureCategoria = cargarCategorias();
  }

  void _onCategoryChanged(Categoria? newCategory) {
    setState(() {
      selectedCategory = newCategory;
      futureNoticias = cargarNoticias(newCategory?.id);
    });
  }

  void _clearFilter() {
    setState(() {
      _searchController.clear();
      selectedCategory = null;
      futureNoticias = cargarNoticias(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<Categoria>>(
          future: futureCategoria,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              log('Categories: ${snapshot.error.toString()}');
              return const Center(
                  child: Text('Error al cargar las categorías'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No hay categorías disponibles'));
            } else {
              final categorias = snapshot.data!;
              return CustomTabBar(
                categorias: categorias,
                selectedCategory: selectedCategory,
                onChanged: _onCategoryChanged,
              );
            }
          },
        ),
        Expanded(
          child: FutureBuilder<List<Noticia>>(
            future: futureNoticias,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                log('List News: ${snapshot.error.toString()}');
                return const Center(
                    child: Text('Error al cargar las noticias'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No hay noticias disponibles'));
              } else {
                final noticias = snapshot.data!;
                return ListView.builder(
                  itemCount: noticias.length,
                  itemBuilder: (context, index) {
                    final noticia = noticias[index];
                    return NewsCard(
                      news: noticia,
                      imageUrl: noticia.imagen,
                      title: noticia.titulo,
                      date: noticia.fecha,
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
