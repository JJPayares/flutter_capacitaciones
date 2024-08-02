import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/news_card.dart';
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
          const NewsCard(
            imageUrl:
                'https://reutersinstitute.politics.ox.ac.uk/sites/default/files/styles/banner/public/2024-05/dnr_2024_banner_compressed_14.jpg?itok=sD6idFo8',
            title: 'Test',
            date: '2023-02-01',
          ),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesNames.userProfile);
              },
            ),
          ),
        ],
      )),
    ));
  }
}
