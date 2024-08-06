import 'package:flutter/material.dart';

class CardButtons extends StatefulWidget {
  const CardButtons({super.key});

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
        onPressed: () {
          // Acción para editar la noticia
          print('Editar noticia');
        },
      ),
      IconButton(
        icon: const Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          // Acción para eliminar la noticia
          print('Eliminar noticia');
        },
      )
    ]);
  }
}
