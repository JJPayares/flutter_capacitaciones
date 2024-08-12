// import 'dart:convert';
// import 'package:flutter_capacitaciones/base/use_case.dart';
// import 'package:flutter_capacitaciones/modules/news/data/models/category.dart';
// import "package:http/http.dart" as http;

// class UcGetCategories extends UseCaseNoParams<List<Categoria>> {
//   UcGetCategories({required this.repository});
//   final CategoriesRepository repository;

//   @override
//   Future<List<Categoria>> call() async {
//     http.Response response = await repository.getCategories();

//     switch (response.statusCode) {
//       case 200:
//         final categoriesList =
//             Categories.categoriesFromJson(utf8.decode(response.bodyBytes))
//                 .toList();
//         return categoriesList;
//       default:
//         throw UseCaseException("Ha ocurrido un error");
//     }
//   }
// }
