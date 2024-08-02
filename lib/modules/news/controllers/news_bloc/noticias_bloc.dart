import 'package:bloc/bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_event.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_state.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
    on<SearchNews>(_onSearchNews);
  }

  void _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final noticias = await cargarNoticias(event.categoryId);
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
}
