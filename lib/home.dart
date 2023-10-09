import 'package:flutter/material.dart';
import 'package:shopping_app/product_list.dart';
import 'package:shopping_app/cart_page.dart'; // Import your CartPage here

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int currentPage;
  late PageController _pageController; // Add a PageController

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // Use PageView for navigating between pages
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: const [
          ProductList(), // Your product list page
          CartPage(), // Your cart page
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
            _pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
        ],
      ),
    );
  }
}
