import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNews extends NewsEvent {
  final int? categoryId;

  const FetchNews(this.categoryId);

  @override
  List<Object> get props => [categoryId ?? -1];
}

class SearchNews extends NewsEvent {
  final String query;

  const SearchNews(this.query);

  @override
  List<Object> get props => [query];
}

class DeleteNews extends NewsEvent {
  final int newsId;

  const DeleteNews(this.newsId);

  @override
  List<Object> get props => [newsId];
}

class EditNews extends NewsEvent {
  int newsId;
  // String titulo;
  // String descripcion;
  // String fecha;
  // String imagen;
  // int categoria;

  EditNews(this.newsId);
  // EditNews(this.newsId, this.titulo, this.descripcion, this.fecha, this.imagen,
  //     this.categoria);

  @override
  List<Object> get props => [newsId];
  // [newsId, titulo, descripcion, fecha, imagen, categoria];
}
