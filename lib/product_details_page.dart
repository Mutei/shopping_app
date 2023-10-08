import 'package:flutter/material.dart';
import 'constants.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Map<String, Object> product;

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
              product['title'] as String,
              style: kBoldedTextStyle,
            ),
            const SizedBox(height: 100), // Use SizedBox for spacing
            Image.asset(
              product['imageUrl'] as String,
            ),
            const SizedBox(height: 50), // Use SizedBox for spacing
            Text(
              '\$${product["price"].toString()}', // Format to 2 decimal places.
              style: kBoldedTextStyle,
            ),
            const SizedBox(height: 100), // Use SizedBox for spacing
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: const Row(
                children: [
                  Chip(
                    backgroundColor: kChipBackgroundColor,
                    label: Text("10"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Chip(
                    backgroundColor: kChipBackgroundColor,
                    label: Text("11"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Chip(
                    backgroundColor: kChipBackgroundColor,
                    label: Text("12"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50), // Use SizedBox for spacing
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    kSeedColor), // Change to your desired color.
                minimumSize: MaterialStateProperty.all<Size>(
                    const Size(350, 48)), // Change to your desired size.
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
}
