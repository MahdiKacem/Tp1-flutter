import 'package:flutter/material.dart';
import 'package:tp1/Screens/HomeScreen/home_cell.dart';
import 'package:tp1/Models/book.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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

      // Use SafeArea and add horizontal padding so cells are aligned and spaced nicely
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          itemCount: books.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) => HomeCell(books[index]),
        ),
      ),
    );
  }
}