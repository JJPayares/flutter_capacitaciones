import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/news.dart';
import 'package:flutter_capacitaciones/modules/news/ui/pages/detail_news.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/bookmark_icon.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/card_buttons.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/custom_card.dart';

class NewsCard extends StatefulWidget {
  final Noticia news;
  final String imageUrl;
  final String title;
  final String date;
  final int id;

  const NewsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.news,
    required this.id,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Handle the tap event here
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailNewsPage(noticia: widget.news),
            ),
          );
        },
        child: Card(
          shape: const CustomCard(
            borderRadius: Radius.circular(18),
            holeSize: 32,
          ),
          elevation: 4,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      widget.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.date,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 7,
                right: 7,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const BookmarkIcon(),
                ),
              ),
              Positioned(
                  child: CardButtons(
                newsId: widget.id,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
