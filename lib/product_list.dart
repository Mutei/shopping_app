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
  String searchText = ''; // Store search input
  List<Map<String, Object>> filteredProducts = []; // Filtered products list

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
    filteredProducts = products; // Initialize with all products
  }

  // Function to filter products based on search text
  void filterProducts(String text) {
    setState(() {
      searchText = text;
      filteredProducts = products
          .where((product) => product['title']
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()))
          .toList();
    });
  }

  void choiceProducts(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == 'All') {
        filteredProducts = products; // Show all products
      } else {
        filteredProducts = products
            .where(
                (product) => product['company'] == filter) // Filter by company
            .toList();
      }
    });
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
                    onChanged:
                        filterProducts, // Call filterProducts when text changes
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
                          choiceProducts(filter);
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
                itemCount: filteredProducts.length, // Use filtered products
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        // Cast the 'product' Map to Map<String, Object> here
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
