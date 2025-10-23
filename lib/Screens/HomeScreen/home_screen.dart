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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        title: Text(
          "Store INSAT",
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 2,
        surfaceTintColor: colorScheme.primary,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          itemCount: books.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) => HomeCell(books[index]),
        ),
      ),
      // Optional: Bottom Navigation for Material 3 style
      bottomNavigationBar: NavigationBar(
        height: 60,
        backgroundColor: colorScheme.surface,
        elevation: 3,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedIndex: 0, // you can manage state to switch
        onDestinationSelected: (index) {
          // Handle navigation change here
        },
      ),
    );
  }
}
