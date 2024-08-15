import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/category_bloc/categorias_bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/data/repository/r_posts.dart';
import 'package:flutter_capacitaciones/modules/posts/data/use_cases/uc_delte_posts.dart';
import 'package:flutter_capacitaciones/modules/posts/data/use_cases/uc_get_posts.dart';
import 'package:flutter_capacitaciones/modules/posts/ui/page/posts_page.dart';
import 'package:flutter_capacitaciones/ui/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => PostsBloc(
              deletePostsUseCase:
                  DeletePostsUseCase(repository: PostsRepository()),
              getPostsUseCase: GetPostsUseCase(repository: PostsRepository())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const PostsPage(),
        onGenerateRoute: (settings) {
          return CustomRoutes.routes(settings);
        },
      ),
    );
  }
}
