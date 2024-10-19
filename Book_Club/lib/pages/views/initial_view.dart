import 'package:Book_Club/pages/main_page/cubit/main_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Book_Club/pages/model/book.dart';
import 'package:Book_Club/widgets/book_cover.dart';
// Import your cubit file here

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<InitialView> {
  List<Book> bookList = List.generate(10, (index) => Book.createMockBook());
  String sortBy = '';

  void sortBooks(String criteria) {
    setState(() {
      sortBy = criteria;
      if (criteria == 'Author') {
        bookList.sort((a, b) => a.author.compareTo(b.author));
      } else if (criteria == 'Title') {
        bookList.sort((a, b) => a.title.compareTo(b.title));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        if (state is MainPageInitial) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.account_circle_sharp),
                  onPressed: () {},
                ),
              ],
              centerTitle: true,
              title: const Text("Book Club Home"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Sort by',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 20),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                          ),
                          child: const Text("Author"),
                          onPressed: () => sortBooks('Author'),
                        ),
                        const SizedBox(width: 5),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                          ),
                          child: const Text("Title"),
                          onPressed: () => sortBooks('Title'),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Books',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // Check if it's the last item in the list
                        final isLastItem = index == bookList.length - 1;
                        final bookCover = Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                          child: BookCover(book: bookList[index]),
                        );

                        // Wrap only the last item with GestureDetector
                        return isLastItem
                            ? GestureDetector(
                                onTap: () {
                                  // Trigger the state change in the cubit only for the last item
                                  context
                                      .read<MainPageCubit>()
                                      .viewBook(bookList[index]);
                                },
                                child: bookCover,
                              )
                            : bookCover;
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                            width: 10); // Space between book covers
                      },
                      itemCount: bookList.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is BookPage) {
          // Display the book details page
          return Scaffold(
            appBar: AppBar(
              title: const Text("Book Details"),
            ),
            body: const Center(
              child: Text('Book Details Page'), // You can customize this view
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
