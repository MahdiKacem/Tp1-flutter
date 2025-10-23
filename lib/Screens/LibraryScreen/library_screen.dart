import 'package:flutter/material.dart';
import 'package:tp1/Models/book.dart';
import 'package:tp1/Screens/LibraryScreen/library_cell.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  final List<Book> books = const [
    Book(name: "Harry Potter and The Cursed Child", price: 40, image: 'assets/hp.jpg'),
    Book(name: "Lost Stars", price: 35, image: 'assets/ls.jpg'),
    Book(name: "The Search For Wondla", price: 45, image: 'assets/sfw.jpg'),
    Book(name: "The Story of a Lonely Boy", price: 30, image: 'assets/tsolb.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        surfaceTintColor: colorScheme.primary,
        elevation: 2,
        title: Text(
          "Store INSAT",
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return LibraryCell(books[index]);
            },
          ),
        ),
      ),
    );
  }
}
