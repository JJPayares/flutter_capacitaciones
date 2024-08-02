import 'package:equatable/equatable.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
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
