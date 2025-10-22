import 'package:flutter/material.dart';
import 'package:tp1/Models/book.dart';

/// variable globale partagée entre toutes les instances de DetailsScreen
int quantity = 10; // valeur initiale — changez si besoin

class DetailsScreen extends StatefulWidget {
  final Book book;
  const DetailsScreen({required this.book, super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.name),
        backgroundColor: const Color.fromARGB(255, 33, 107, 235),
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
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Afficher la quantité restante (variable globale)
          Center(
            child: Text(
              'Quantity: $quantity',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(Icons.shopping_bag),
            label: const Text(
              "Purchase",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: quantity > 0
                ? () {
                    // décrémenter la variable globale et rebuild l'écran
                    setState(() {
                      quantity = quantity - 1;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Purchased: ${widget.book.name}')),
                    );
                  }
                : null, // disabled si quantité = 0
          ),
        ],
      ),
    );
  }
}