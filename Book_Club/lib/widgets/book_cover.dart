import 'package:flutter/material.dart';
import '../pages/model/book.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                alignment: Alignment.center),
            Text(
              'Title: ${book.title}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text('Author: ${book.author}'),
          ],
        ),
      )),
    );
  }
}
