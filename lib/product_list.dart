import 'package:flutter/material.dart';
import 'package:shopping_app/product_container.dart';
import 'package:shopping_app/product_details_page.dart';

import 'constants.dart';
import 'global_variable.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Text("Shoes\nCollection", style: kBoldedTextStyle),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      border: kSearchBorder,
                      enabledBorder: kSearchBorder,
                    ),
                    onChanged: (text) {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: selectedFilter == filter
                              ? kSelectedChipBackGroundColor
                              : kChipBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          label: Text(
                            filter,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetailsPage(product: product);
                      }));
                    },
                    child: ProductContainer(
                      title: product['title'] as String,
                      price: (product['price'] as num).toDouble(),
                      image: product['imageUrl'] as String,
                      colour: index.isEven
                          ? Colors.white
                          : const Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
