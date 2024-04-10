import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_app/Product.dart';
import 'package:my_flutter_app/ProductCard.dart';
import 'package:my_flutter_app/productdetail.dart';

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
      index: 1,
        image: 'assets/belt.jpg',
        name: 'product1',
        price: 500),
    Product(
        index: 2,
        image: 'assets/belt2.jpg',
        name: 'product2',
        price: 500),
    Product(
        index: 3,
        image: 'assets/belt3.jpg',
        name: 'product3',
        price: 500),
    Product(
        index: 4,
        image: 'assets/belt4.jpg',
        name: 'product4',
        price: 500),
    Product(
        index: 5,
        image: 'assets/belt5.jpg',
        name: 'product5',
        price: 500),
    Product(
        index: 6,
        image: 'assets/belt6.jpg',
        name: 'product6',
        price: 500),
    Product(
        index: 7,
        image: 'assets/belt7.jpg',
        name: 'product7',
        price: 500),
    Product(
        index: 8,
        image: 'assets/belt8.jpg',
        name: 'product8',
        price: 500),
    Product(
        index: 9,
        image: 'assets/belt9.jpg',
        name: 'product9',
        price: 500),
    Product(
        index: 10,
        image: 'assets/belt10.jpg',
        name: 'product10',
        price: 500),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("HomeScreen"),
          backgroundColor: Colors.white,
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
            itemCount: products.length,
            itemBuilder: (context,index){
              return ProductCard(
                  products: products, index: index);
            }),
          ),
        );
  }
}








