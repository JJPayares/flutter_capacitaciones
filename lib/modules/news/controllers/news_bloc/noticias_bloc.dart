import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_event.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_state.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<Noticia> _noticias = [];

  NewsBloc() : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
    on<SearchNews>(_onSearchNews);
    on<DeleteNews>(_onDeleteNews);
    on<EditNews>(_onEditNews);
  }

  void _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final noticias = await cargarNoticias(event.categoryId);
      _noticias = noticias;
      emit(NewsLoaded(noticias));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void _onSearchNews(SearchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final allNoticias = await cargarNoticias(null);
      final filteredNoticias = allNoticias.where((noticia) {
        return noticia.titulo.contains(event.query) ||
            noticia.descripcion.contains(event.query);
      }).toList();
      emit(NewsLoaded(filteredNoticias));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void _onDeleteNews(DeleteNews event, Emitter<NewsState> emit) {
    emit(NewsLoading());
    try {
      _noticias.removeWhere((noticia) => noticia.id == event.newsId);
      emit(NewsLoaded(_noticias));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void _onEditNews(EditNews event, Emitter<NewsState> emit) {
    emit(NewsLoading());
    try {
      Noticia noticia =
          _noticias.firstWhere((noticia) => noticia.id == event.newsId);
      log(noticia.toString());
      // if (event.titulo.isNotEmpty) {
      //   noticia.titulo = event.titulo;
      // }

      // if (event.descripcion.isNotEmpty) {
      //   noticia.descripcion = event.descripcion;
      // }

      // if (event.fecha.isNotEmpty) {
      //   noticia.fecha = event.fecha;
      // }

      // if (event.imagen.isNotEmpty) {
      //   noticia.imagen = event.imagen;
      // }

      // if (!event.categoria.isNaN) {
      //   noticia.categoria = event.categoria;
      // }

      emit(NewsLoaded(_noticias));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
