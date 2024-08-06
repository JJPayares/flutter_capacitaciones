import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/category_bloc/categorias_bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/category_bloc/categorias_event.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/category_bloc/categorias_state.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_event.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_state.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/category.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/add_button.dart';
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
  Categoria? selectedCategory;

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(const FetchNews(null));
    context.read<CategoryBloc>().add(FetchCategories());
  }

  void _onCategoryChanged(Categoria? newCategory) {
    context.read<NewsBloc>().add(FetchNews(newCategory?.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategoryError) {
                log('Categories: ${state.message}');
                return const Center(
                    child: Text('Error al cargar las categorías'));
              } else if (state is CategoryLoaded) {
                final categorias = state.categories;
                return CustomTabBar(
                  categorias: categorias,
                  selectedCategory: selectedCategory,
                  onChanged: _onCategoryChanged,
                );
              } else {
                return const Center(
                    child: Text('No hay categorías disponibles'));
              }
            },
          ),
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsError) {
                  log('List News: ${state.message}');
                  return const Center(
                      child: Text('Error al cargar las noticias'));
                } else if (state is NewsLoaded) {
                  final noticias = state.noticias;
                  return ListView.builder(
                    itemCount: noticias.length,
                    itemBuilder: (context, index) {
                      final noticia = noticias[index];
                      return NewsCard(
                        news: noticia,
                        imageUrl: noticia.imagen,
                        title: noticia.titulo,
                        date: noticia.fecha,
                        id: noticia.id,
                      );
                    },
                  );
                } else {
                  return const Center(
                      child: Text('No hay noticias disponibles'));
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: const AddButton(),
    );
  }
}
