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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 107, 235),
        title: const Text(
          "Store INSAT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.builder(
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
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