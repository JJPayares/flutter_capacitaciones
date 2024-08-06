import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_bloc.dart';
import 'package:flutter_capacitaciones/modules/news/controllers/news_bloc/noticias_event.dart';

class CardButtons extends StatefulWidget {
  const CardButtons({super.key, required this.newsId});

  final int newsId;

  @override
  State<CardButtons> createState() => CardButtonsState();
}

class CardButtonsState extends State<CardButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        icon: const Icon(Icons.edit),
        color: Colors.blueAccent,
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          context.read<NewsBloc>().add(DeleteNews(widget.newsId));
        },
      )
    ]);
  }
}
