import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/ui/routes/names.dart';

class ListNewsPage extends StatefulWidget {
  const ListNewsPage({super.key});

  @override
  State<ListNewsPage> createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Center(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutesNames.detailNews);
            },
          ),
        )
      ],
    ));
  }
}
