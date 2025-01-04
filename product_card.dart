import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback onAddToCart;

  ProductCard({required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/shirt4.jpg', fit: BoxFit.cover, height: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Product Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Product description here...', style: TextStyle(fontSize: 14)),
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: onAddToCart,
          ),
        ],
      ),
    );
  }
}