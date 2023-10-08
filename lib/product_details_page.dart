import 'package:flutter/material.dart';
import 'constants.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage(
      {Key? key,
      required this.titleProduct,
      required this.imageProduct,
      required this.priceProduct})
      : super(key: key);
  final Map<String, Object> titleProduct;
  final Map<String, Object> imageProduct;
  final Map<String, Object> priceProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          Text(
            titleProduct['title'] as String,
            style: kBoldedTextStyle,
          ),
          const Spacer(),
          Image.asset(
            imageProduct['imageUrl'] as String,
          ),
          const Spacer(),
          Text(
            '\$${titleProduct["price"].toString()}', // Use toStringAsFixed to format to 2 decimal places.
            style: kBoldedTextStyle,
          ),
          const Spacer(),
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
          const Spacer(),
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
          )
        ],
      ),
    );
  }
}
