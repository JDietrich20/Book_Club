import 'package:Book_Club/pages/main_page/cubit/main_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedBook = context.read<MainPageCubit>().selectedBook;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.read<MainPageCubit>().backMain();
            },
          ),
          title: const Text("Book Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 200,
                width: 150,
                color: Colors.blue,
                margin: const EdgeInsets.only(bottom: 30),
                child: const Text(
                  "Book cover",
                  textScaler: TextScaler.linear(2),
                  textAlign: TextAlign.center,
                )),
            Text(
              'Title: ${selectedBook?.title ?? 'Unknown'}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Author: ${selectedBook?.author ?? 'Unknown'}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Description: ${selectedBook?.description ?? 'Unknown'}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}


// child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//                 padding: const EdgeInsets.all(20),
//                 width: double.infinity,
//                 alignment: Alignment.center),
//             Text(
//               'Title: ${book.title}',
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             Text('Author: ${book.author}'),
//           ],
//         ),