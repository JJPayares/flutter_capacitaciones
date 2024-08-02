import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/category_bloc/categorias_bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_bloc.dart';
import 'package:flutter_capacitaciones/modules/user_profile/ui/pages/user_profile.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const UserProfile(),
        onGenerateRoute: (settings) {
          return CustomRoutes.routes(settings);
        },
      ),
    );
  }
}
