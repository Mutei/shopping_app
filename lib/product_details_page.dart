import 'package:flutter/material.dart';
import 'constants.dart';
import 'cart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Map<String, Object> product;
  final List<String> filters = const ['10', '11', '12'];
  final List<Map<String, Object>> cartItems = []; // Declare cartItems here

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedChipIndex = 0; // Initialize the first chip as selected

  @override
  void initState() {
    super.initState();
    selectedChipIndex = 0; // Initialize the first chip as selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: kBoldedTextStyle,
            ),
            const SizedBox(height: 100),
            Image.asset(
              widget.product['imageUrl'] as String,
            ),
            const SizedBox(height: 50),
            Text(
              '\$${widget.product["price"].toString()}',
              style: kBoldedTextStyle,
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  buildChip(0, '10'), // Build the first chip
                  const SizedBox(
                    width: 20,
                  ),
                  buildChip(1, '11'), // Build the second chip
                  const SizedBox(
                    width: 20,
                  ),
                  buildChip(2, '12'), // Build the third chip
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                widget.cartItems.add(widget.product);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: widget.cartItems),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(kSeedColor),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(350, 48)),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 100,
                    ),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: kCartChildrenColor,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kCartChildrenColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChip(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedChipIndex = index; // Update the selected chip
        });
      },
      child: Chip(
        backgroundColor:
            selectedChipIndex == index ? Colors.yellow : kChipBackgroundColor,
        label: Text(label),
      ),
    );
  }
}
