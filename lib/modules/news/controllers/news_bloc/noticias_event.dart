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

  EditNews(this.newsId);
  @override
  List<Object> get props => [newsId];
}
