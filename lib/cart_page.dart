import 'package:flutter/material.dart';
import 'constants.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, Object>> cartItems; // Receive cartItems as a parameter

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Page",
          style: kBoldedTextStyle,
        ),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(item['title'] as String),
            subtitle: Text('\$${item['price']}'),
            // Display other necessary information about the product
          );
        },
      ),
    );
  }
}
