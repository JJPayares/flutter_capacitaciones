import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/ui/pages/list_news.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/page_header.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const PageHeader(
          textTitle: 'News ',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(242, 238, 234, 234),
      body: const SingleChildScrollView(
          child: Column(
        children: [ListNewsPage()],
      )),
    ));
  }
}
