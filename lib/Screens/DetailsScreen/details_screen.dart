import 'package:flutter/material.dart';
import 'package:tp1/Models/book.dart';

int quantity = 10; // variable globale

class DetailsScreen extends StatefulWidget {
  final Book book;
  const DetailsScreen({required this.book, super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.name),
        backgroundColor: colorScheme.primary, // use Material 3 primary color
        foregroundColor: colorScheme.onPrimary, // text color
        surfaceTintColor: colorScheme.primary, // M3 effect
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              widget.book.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur adipiscing elit. Sed non risus. "
              "Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. "
              "Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "${widget.book.price} TND",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary, // M3 color
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Quantity: $quantity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: FilledButton.icon(
              icon: const Icon(Icons.shopping_bag),
              label: const Text(
                "Purchase",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              onPressed: quantity > 0
                  ? () {
                      setState(() {
                        quantity--;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Purchased: ${widget.book.name}')),
                      );
                    }
                  : null, // disabled if quantity = 0
            ),
          ),
        ],
      ),
    );
  }
}
