import 'package:flutter/material.dart';
import 'home.dart';
import 'constants.dart';
import 'product_details_page.dart';
import 'global_variable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
          fontFamily: 'Lato',
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          useMaterial3: true),
      home: ProductDetailsPage(
        titleProduct: products[0],
        imageProduct: products[0],
        priceProduct: products[0],
      ),
    );
  }
}
