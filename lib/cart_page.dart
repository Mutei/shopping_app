import 'package:flutter/material.dart';
import 'constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Page",
          style: kBoldedTextStyle,
        ),
      ),
    );
  }
}
