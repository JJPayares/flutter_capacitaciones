import 'package:flutter/material.dart';

class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.bookmark,
        color: Colors.blue,
      ),
      onPressed: () {},
    );
  }
}
