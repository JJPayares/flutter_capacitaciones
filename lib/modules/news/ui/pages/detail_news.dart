import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/page_header.dart';
import 'package:flutter_capacitaciones/ui/routes/names.dart';

class DetailNewsPage extends StatefulWidget {
  const DetailNewsPage({super.key});

  @override
  State<DetailNewsPage> createState() => _DetailNewsPageState();
}

class _DetailNewsPageState extends State<DetailNewsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const PageHeader(
          textTitle: 'Detail News ',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(242, 238, 234, 234),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesNames.userProfile);
              },
            ),
          )
        ],
      )),
    ));
  }
}
