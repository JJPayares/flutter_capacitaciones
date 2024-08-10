import 'package:equatable/equatable.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';

class NewsState extends Equatable {
  const NewsState({
    this.titulo = "",
    this.categoria,
    this.descripcion = "",
    this.fecha = "",
    this.imagen,
  });

  final String? titulo;
  final int? categoria;
  final String? descripcion;
  final String? fecha;
  final dynamic imagen;

  NewsState copyWhit({
    final String? titulo,
    final int? categoria,
    final String? descripcion,
    final String? fecha,
    final dynamic imagen,
  }) {
    return NewsState(
        titulo: titulo ?? this.titulo,
        categoria: categoria ?? this.categoria,
        descripcion: descripcion ?? this.descripcion,
        fecha: fecha ?? this.descripcion,
        imagen: imagen ?? this.imagen);
  }

  @override
  List<Object?> get props => [titulo, categoria, descripcion, fecha, imagen];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Noticia> noticias;

  const NewsLoaded(this.noticias);

  @override
  List<Object> get props => [noticias];
}

class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object> get props => [message];
}
