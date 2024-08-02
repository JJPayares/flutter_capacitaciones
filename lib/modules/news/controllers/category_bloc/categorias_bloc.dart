import 'package:bloc/bloc.dart';

import 'package:flutter_capacitaciones/modules/news/controllers/category_bloc/categorias_event.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/category_bloc/categorias_state.dart';
import 'package:flutter_capacitaciones/modules/news/data/repository/repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<FetchCategories>(_onFetchCategories);
  }

  void _onFetchCategories(
      FetchCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await cargarCategorias();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
