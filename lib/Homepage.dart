import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_app/Product.dart';

void main() {
  runApp( const Home_Screen());
}

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});
  // This widget is the root of your application.
   @override
   State<Home_Screen> createState() => Loginpage();
}
class Loginpage extends State<Home_Screen> {
  final List<Product> products = [
    Product(
        image: 'assets/belt.jpg',
        name: 'product1',
        price: 500),
    Product(
        image: 'assets/belt2.jpg',
        name: 'product1',
        price: 500),
    Product(
        image: 'assets/belt3.jpg',
        name: 'product1',
        price: 500),
    Product(
        image: 'assets/belt4.jpg',
        name: 'product1',
        price: 500),
    Product(
        image: 'assets/belt5.jpg',
        name: 'product1',
        price: 500),
    Product(
        image: 'assets/belt6.jpg',
        name: 'product1',
        price: 500),
    Product(
        image: 'assets/belt7.jpg',
        name: 'product1',
        price: 500),
    Product(
        image: 'assets/belt8.jpg',
        name: 'product1',
        price: 500),
    Product(
        image: 'assets/belt9.jpg',
        name: 'product1',
        price: 500),
    Product(
        image: 'assets/belt10.jpg',
        name: 'product1',
        price: 500),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text("HomeScreen"),
          backgroundColor: Colors.blueAccent,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          // Set the number of columns in the grid
          padding: const EdgeInsets.all(8.0),
          mainAxisSpacing: 8.0,
          // Spacing between rows
          crossAxisSpacing: 8.0,
          // Spacing between columns
          children: products.map((product) => ProductCard(product: product))
              .toList(),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
 final Product product;
   const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4.0)],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
            child: Image.asset(
              product.image, // Use product.imageUrl for the path
              fit: BoxFit.cover,
              height: 150.0, // Set image height
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\$${product.price.toStringAsFixed(2)}', // Format price with two decimal places
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}







